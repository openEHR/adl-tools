#!/usr/bin/perl
#
# $Source$
# $Date$
# $Revision$
#
# This script generates a source file in any programming language
# which has a profile file called lang_profile.txt. The source file
# contains a class called OPENEHR_VERSION (or OpenEhrVersion...)
#
# Example usage: generate_version
#	this script should be run as a bk post-commit and post-incoming trigger
#
# language profile files should contain the name/value pairs like:
#	file_extension = ".e"
#	class_header = "class OPENEHR_VERSION"
#	feature_decl = "	feature -- Access\nversion: STRING is \"$substr\""
#	class_footer =  "end"
#	newline =  "%N"
#
# Note that the feature_decl value should contain the var name $substr
#
# Copyright (C) 2004, Ocean Informatics Pty Ltd
#----------------------------------------------------------------

use Getopt::Long;

use Time::Local;

#----------------------------------------------------------------
# extract_data_from_file
#
# Open given filename and parse all the tag/value pairs from it
# in form 
#	var_name = "value csdsdf"
# strips off the "" from each value
# Returns a reference to the hash containing them.
#

sub extract_data_from_file {
  my($filename) = @_;

  my %data;

  open(DAT, "< $filename") || die "Error: could not open data file: $filename: $!\n";

  # Process lines until no more lines (i.e. EOF)
  while (defined ($line = <DAT>)) {

	if ($line =~ /^#/ or $line =~ /^\s*$/) {
		# nothing
	} elsif ($line =~ /^(\S+)\s*\=\s*(.*)/) {
		# Line starts with a sequence of non-whitespace characters
		# followed by a '=' and then other text -- must be a tag name

		my $tag = $1;
		my $value = $2;
		chomp($tag);
		chomp($value);

		# remove quotes
		$value =~ s/^"(.*)"\s*$/$1/;

		# - Save tag values
		$data{$tag} = $value;
	} else {
		die "Error: $filename: unexpected format in line: \"$line\"\n";
	}
  }

  return \%data;
}


#----------------------------------------------------------------

sub main {
	my $root_dir = "$ENV{OPENEHR}/adl_ref_parser-dev/scripts";

	print "root_dir is: $root_dir\n";

	chdir $root_dir;
	
	my @lang_files = `ls -1 *_profile.txt`;
	foreach my $lang_file (@lang_files) {
		my $lang = "$lang_file";
		$lang =~ s/_profile.txt//;
		chomp($lang);
		print "generating file for language = $lang\n";

		my $profile_file = $lang . "_profile\.txt";
		print "	profile file = $profile_file\n";
		my $lang_vals = extract_data_from_file($profile_file);

		my $out_file = "../version_files/openehr_version" . "$lang_vals->{\"file_extension\"}";
		print "	output file = $out_file\n";
		open(OUTFILE, "> $out_file") || die "Error: could not open target file for writing: $out_file: $!\n";

		# --- output file header
		print OUTFILE "$lang_vals->{\"class_header\"}\n\n";

		my $feature_decl = $lang_vals->{"feature_decl"};

		my $verdata = `bk prs -hr+ -d'\tversion=:I: (:Dd:-:DM:-:Dy: :T:)%N\t' ../ChangeSet`;
		$verdata .= "build timestamp=" . scalar(localtime) . "%N";

		# --- FIXME - should obtain Tag name if there is a tag at current version and add that

		$feature_decl =~ s/\$substr/$verdata/;
		$feature_decl =~ s/\\n/\n/g;
		my $newline_expr = $lang_vals->{"newline"};
		$feature_decl =~ s/%N/$newline_expr/g;

		print OUTFILE "$feature_decl";

		print OUTFILE "\n";
		print OUTFILE "$lang_vals->{\"class_footer\"}\n\n";

		close OUTFILE;
	}
}

#----------------------------------------------------------------

exit main();

#----------------------------------------------------------------
#EOF

