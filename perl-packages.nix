{ pkgs }:
with pkgs; with perlPackages; rec
{
  CodeTidyAll = buildPerlPackage {
    pname = "Code-TidyAll";
    version = "0.84";
    src = fetchurl {
      url = "mirror://cpan/authors/id/D/DR/DROLSKY/Code-TidyAll-0.84.tar.gz";
      hash = "sha256-s8AU4e3X9EBHkJjkHkeHNhBy9QE6ZqX4j5a05Tyisfc=";
    };
    nativeBuildInputs = lib.optional stdenv.isDarwin shortenPerlShebang;
    propagatedBuildInputs = [ CaptureTiny ConfigINI FileWhich Filepushd IPCRun3 IPCSystemSimple ListCompare ListSomeUtils LogAny Moo ScopeGuard SpecioLibraryPathTiny TextDiff TimeDate TimeDurationParse ];
    buildInputs = [ TestClass TestClassMost TestDeep TestDifferences TestException TestFatal TestMost TestWarn TestWarnings librelative ];
    postInstall = lib.optionalString stdenv.hostPlatform.isDarwin ''
      shortenPerlShebang $out/bin/tidyall
    '';
    meta = {
      description = "Engine for tidyall, your all-in-one code tidier and validator";
      homepage = "https://metacpan.org/release/Code-TidyAll";
      license = with lib.licenses; [ artistic1 gpl1Plus ];
      mainProgram = "tidyall";
    };
  };
  VersionNext = buildPerlPackage {
    pname = "Version-Next";
    version = "1.000";
    src = fetchurl {
      url = "mirror://cpan/authors/id/D/DA/DAGOLDEN/Version-Next-1.000.tar.gz";
      hash = "sha256-4hY81OPoBWYsLtZ4j9o1hw/YBOzZSVVMVkVPUPjR0aE=";
    };
    buildInputs = [ TestException ];
    propagatedBuildInputs = [ SubExporter ];
    meta = {
      homepage = "https://github.com/dagolden/Version-Next";
      description = "Increment module version numbers simply and correctly";
      license = lib.licenses.asl20;
    };
  };
  DistZillaPluginGit = buildPerlPackage {
    pname = "Dist-Zilla-Plugin-Git";
    version = "2.051";
    src = fetchurl {
      url = "mirror://cpan/authors/id/E/ET/ETHER/Dist-Zilla-Plugin-Git-2.051.tar.gz";
      hash = "sha256-WsBMGbMwuvYnssM9+MBWXAiKa8fWOSV/jlce9gchFpQ=";
    };
    buildInputs = [ CPANMetaCheck FileCopyRecursive FileWhich Filepushd LogDispatchouli TestFatal TestDeep ];
    propagatedBuildInputs = [ DateTime DistZilla DistZillaPluginConfigGit Filechdir GitWrapper IPCSystemSimple ModuleRuntime Moose MooseXHasSugar PathTiny StringFormatter TryTiny TypeTiny TypesPathTiny VersionNext namespaceautoclean ];
    meta = {
      homepage = "https://github.com/karenetheridge/Dist-Zilla-Plugin-Git";
      description = "Update your git repository after release";
      license = with lib.licenses; [ artistic1 gpl1Plus ];
    };
  };
  TypesPathTiny = buildPerlPackage {
    pname = "Types-Path-Tiny";
    version = "0.006";
    src = fetchurl {
      url = "mirror://cpan/authors/id/D/DA/DAGOLDEN/Types-Path-Tiny-0.006.tar.gz";
      hash = "sha256-WT/J+u28aSgGWcDM6FFo+OehcUys346ea3SJvhjf4oA=";
    };
    buildInputs = [ Filepushd ];
    propagatedBuildInputs = [ PathTiny TypeTiny ];
    meta = {
      homepage = "https://github.com/dagolden/types-path-tiny";
      description = "Path::Tiny types and coercions for Moose and Moo";
      license = lib.licenses.asl20;
    };
  };
  GitWrapper = buildPerlPackage {
    pname = "Git-Wrapper";
    version = "0.048";
    src = fetchurl {
      url = "mirror://cpan/authors/id/G/GE/GENEHACK/Git-Wrapper-0.048.tar.gz";
      hash = "sha256-njv/dIYZP6fkyAd0qhdRiP91px1VjswGUB3askxFGI0=";
    };
    buildInputs = [ DevelCheckBin TestDeep TestException ];
    propagatedBuildInputs = [ git Filechdir SortVersions ];
    meta = {
      homepage = "http://genehack.github.com/Git-Wrapper/";
      description = "Wrap git(7) command-line interface";
      license = with lib.licenses; [ artistic1 gpl1Plus ];
    };
  };
  DistZillaPluginConfigGit = buildPerlPackage {
    pname = "Dist-Zilla-Plugin-Config-Git";
    version = "0.92";
    src = fetchurl {
      url = "mirror://cpan/authors/id/B/BB/BBYRD/Dist-Zilla-Plugin-Config-Git-0.92.tar.gz";
      hash = "sha256-UC81hp3QhBy5hecH0CXsZdFN1POJxiSHACaHT5vfgqU=";
    };
    buildInputs = [ TestCheckDeps ];
    propagatedBuildInputs = [ DistZilla Moose MooseXTypes StringErrf namespaceclean ];
    meta = {
      homepage = "https://github.com/SineSwiper/Dist-Zilla-Plugin-Config-Git";
      description = "Plugin configuration containing settings for a Git repo";
      license = lib.licenses.artistic2;
    };
  };
  DistZillaPluginTestPerlCritic = buildPerlPackage {
    pname = "Dist-Zilla-Plugin-Test-Perl-Critic";
    version = "3.004";
    src = fetchurl {
      url = "mirror://cpan/authors/id/E/ET/ETHER/Dist-Zilla-Plugin-Test-Perl-Critic-3.004.tar.gz";
      hash = "sha256-P+7xqRfAh/1CBIOLfHUFmL/GvZVJpnFdocujn4moqNo=";
    };
    buildInputs = [ ModuleBuildTiny TestDeep ];
    propagatedBuildInputs = [ DataSection DistZilla Moose SubExporterForMethods namespaceautoclean TestPerlCritic ];
    meta = {
      homepage = "https://github.com/karenetheridge/Dist-Zilla-Plugin-Test-Perl-Critic";
      description = "Tests to check your code against best practices";
      license = with lib.licenses; [ artistic1 gpl1Plus ];
    };
  };
  TestPerlCritic = buildPerlModule {
    pname = "Test-Perl-Critic";
    version = "1.04";
    src = fetchurl {
      url = "mirror://cpan/authors/id/P/PE/PETDANCE/Test-Perl-Critic-1.04.tar.gz";
      hash = "sha256-KPgGtUEseQi1bPFnMIS4tEzhy1TJQX14TZFCjhoECW4=";
    };
    propagatedBuildInputs = [ MCE PerlCritic ];
    meta = {
      homepage = "http://perlcritic.com";
      description = "Use Perl::Critic in test programs";
      license = with lib.licenses; [ artistic1 gpl1Plus ];
    };
  };
  DistZillaPluginPodWeaver = buildPerlPackage {
    pname = "Dist-Zilla-Plugin-PodWeaver";
    version = "4.010";
    src = fetchurl {
      url = "mirror://cpan/authors/id/R/RJ/RJBS/Dist-Zilla-Plugin-PodWeaver-4.010.tar.gz";
      hash = "sha256-Zm1S1UXUjSpn8VN63HTPOMdkofmVHQtiNiP2IGDLYj4=";
    };
    buildInputs = [ FileFindRule ];
    propagatedBuildInputs = [ DistZilla Moose PPI PodElementalPerlMunger PodWeaver namespaceautoclean ];
    meta = {
      homepage = "https://github.com/rjbs/Dist-Zilla-Plugin-PodWeaver";
      description = "Weave your Pod together from configuration and Dist::Zilla";
      license = with lib.licenses; [ artistic1 gpl1Plus ];
    };
  };
}
