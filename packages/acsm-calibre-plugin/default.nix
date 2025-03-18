{
  stdenv,
  fetchFromGitHub,
  zip,
  unzip,
  fetchurl,
  openssl_3,
  ...
}:
let
  oscrypto = fetchurl {
    url = "https://github.com/Leseratte10/acsm-calibre-plugin/releases/download/config/oscrypto_1.3.0_fork_2023-12-19.zip";
    hash = "sha256-D872/kQemxB2D7yUSuCIreAMGJOc9V7PtVommZPlwxc=";
  };
  asn1crypto = fetchurl {
    url = "https://github.com/Leseratte10/acsm-calibre-plugin/releases/download/config/asn1crypto_1.5.1.zip";
    hash = "sha256-f0Wtf5qLAtuPqQ80uOfWtV4grf5CChRL3fcjkMSmEFA=";
  };
in
stdenv.mkDerivation {
  name = "acsm-calibre-plugin";

  src = fetchFromGitHub {
    owner = "Leseratte10";
    repo = "acsm-calibre-plugin";
    rev = "97e6ddc1f13024c4406f2a6f2af1d9bca259fa84";
    hash = "sha256-uVPs6hgpIrWywcFkbSsGoIA4ZpBBk96zbNVhU4MsJ/Y=";
  };

  buildInputs = [
    zip
    unzip
    openssl_3
  ];

  buildPhase = ''
    set -e
    
    cp ${asn1crypto} calibre-plugin/asn1crypto.zip
    cp ${oscrypto} calibre-plugin/oscrypto.zip

    substituteInPlace ./calibre-plugin/__init__.py \
        --replace-fail "libcrypto_path = os.getenv(\"ACSM_LIBCRYPTO\", None)" "libcrypto_path = \"${openssl_3.out}/lib/libcrypto.so\"" \
        --replace-fail "libssl_path = os.getenv(\"ACSM_LIBSSL\", None)" "libssl_path = \"${openssl_3.out}/lib/libssl.so\""

    bash ./bundle_calibre_plugin.sh
    cp calibre-plugin.zip $out
  '';
}
