{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dep-${version}";
  version = "0.3.1";

  src = fetchurl {
    url = "https://github.com/golang/dep/releases/download/v${version}/dep-linux-amd64";
    sha256 = "0ngizim89j26v1mxhvim4ks3qm56lis29lsn5rpr9j1s168ybjn4";
    executable = true;
  };

  buildCommand = ''
      mkdir -p $out/bin
      cp $src $out/bin/dep
  '';

  meta = with stdenv.lib; {
    description = "Go dependency management tool";
    homepage = https://github.com/golang/dep;
    maintainers = [ maintainers.carlsverre ];
    platforms = platforms.linux;
  };
}
