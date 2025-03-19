{
  stdenv,
  fetchFromGitHub,
  python311,
  ensureNewerSourcesForZipFilesHook,
  unzip,
  ...
}:
stdenv.mkDerivation {
  name = "dedrm-plugin";

  src = fetchFromGitHub {
    owner = "noDRM";
    repo = "DeDRM_tools";
    rev = "7379b453199ed1ba91bf3a4ce4875d5ed3c309a9";
    hash = "sha256-Hq/DBYeJ2urJtxG+MiO2L8TGZ9/kLue1DXbG4/KJFhc=";
  };

  buildInputs = [
    python311
    ensureNewerSourcesForZipFilesHook
    unzip
  ];

  buildPhase =
    # sh
    ''
      set -e
      python3 ./make_release.py
      mkdir tmp
      unzip DeDRM_tools.zip -d tmp
      cp tmp/DeDRM_plugin.zip $out
    '';
}
