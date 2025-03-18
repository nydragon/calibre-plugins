{
  stdenv,
  fetchFromGitHub,
  python312Packages,
  zip,
  ...
}:
stdenv.mkDerivation {
  name = "acsm-calibre-plugin";

  src = fetchFromGitHub {
    owner = "Leseratte10";
    repo = "acsm-calibre-plugin";
    rev = "97e6ddc1f13024c4406f2a6f2af1d9bca259fa84";
    hash = "sha256-uVPs6hgpIrWywcFkbSsGoIA4ZpBBk96zbNVhU4MsJ/Y=";
  };

  buildInputs = [
    python312Packages.oscrypto
    python312Packages.asn1crypto
    zip
  ];

  buildPhase = ''
    zip calibre-plugin/oscrypto.zip ${python312Packages.oscrypto}/lib/python3.12/site-packages/oscrypto
    zip calibre-plugin/asn1crypto.zip ${python312Packages.asn1crypto}/lib/python3.12/site-packages/asn1crypto
    ls -la > $out
    bash ./bundle_calibre_plugin.sh
    cp calibre-plugin.zip $out
  '';
}
