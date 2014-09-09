/* Essential system packages that must build. */

{ supportedSystems ? [ "x86_64-linux" ] }:

with (import <nixpkgs/pkgs/top-level/release-lib.nix> { inherit supportedSystems; });

mapTestOn {

  androidenv.platformTools = supportedSystems;
  antiword = supportedSystems;
  asciidocFull = supportedSystems;
  aspellDicts.de = supportedSystems;
  aspellDicts.en = supportedSystems;
  aspell = supportedSystems;
  asymptote = supportedSystems;
  autoconf = supportedSystems;
  automake = supportedSystems;
  banner = supportedSystems;
  bc = supportedSystems;
  bison = supportedSystems;
  celestia = supportedSystems;
  curl = supportedSystems;
  cvsps = supportedSystems;
  cvs = supportedSystems;
  darcs = supportedSystems;
  dash = supportedSystems;
  davfs2 = supportedSystems;
  dia = supportedSystems;
  dmenu = supportedSystems;
  dmidecode = supportedSystems;
  docbook2x = supportedSystems;
  doxygen = supportedSystems;
  duplicity = supportedSystems;
  emacs24Packages.bbdb = supportedSystems;
  emacs24Packages.ess = supportedSystems;
  emacs24Packages.haskellMode = supportedSystems;
  emacs24Packages.magit = supportedSystems;
  emacs24Packages.maudeMode = supportedSystems;
  emacs24Packages.sbtMode = supportedSystems;
  emacs24Packages.scalaMode2 = supportedSystems;
  emacs24Packages.writeGood = supportedSystems;
  emacs = supportedSystems;
  eukleides = supportedSystems;
  expat = supportedSystems;
  fetchmail = supportedSystems;
  ffmpeg = supportedSystems;
  file = supportedSystems;
  firefoxWrapper = supportedSystems;
  flex = supportedSystems;
  gcc = supportedSystems;
  gdb = supportedSystems;
  gettext = supportedSystems;
  ghostscriptX = supportedSystems;
  gitAndTools.gitAnnex = supportedSystems;
  gitAndTools.qgit = supportedSystems;
  gitFull = supportedSystems;
  glxinfo = supportedSystems;
  gmrun = supportedSystems;
  gnucash = supportedSystems;
  gnum4 = supportedSystems;
  gnumake = supportedSystems;
  gnupg1compat = supportedSystems;
  gnuplot = supportedSystems;
  gocr = supportedSystems;
  gparted = supportedSystems;
  gprolog = supportedSystems;
  graphviz = supportedSystems;
  gravit = supportedSystems;
  gv = supportedSystems;
  hardlink = supportedSystems;
  haskellPackages_ghc783.BNFC = supportedSystems;
  haskellPackages_ghc783.cabalInstall = supportedSystems;
  haskellPackages_ghc783.doctest = supportedSystems;
  haskellPackages_ghc783.ghcMod = supportedSystems;
  haskellPackages_ghc783.GLUT = supportedSystems;
  haskellPackages_ghc783.HList = supportedSystems;
  haskellPackages_ghc783.hspec = supportedSystems;
  haskellPackages_ghc783.lens = supportedSystems;
  haskellPackages_ghc783.OpenGL = supportedSystems;
  haskellPackages_ghc783.pandoc = supportedSystems;
  haskellPackages_ghc783.smallcheck = supportedSystems;
  haskellPackages_ghc783.uuParsinglib = supportedSystems;
  haskellPackages_ghc783.xmobar = supportedSystems;
  haskellPackages_ghc783.xmonadContrib = supportedSystems;
  haskellPackages_ghc783.xmonadExtras = supportedSystems;
  haskellPackages_ghc783.xmonad = supportedSystems;
  htmlTidy = supportedSystems;
  htop = supportedSystems;
  id3v2 = supportedSystems;
  ikiwiki = supportedSystems;
  imagemagick = supportedSystems;
  lame = supportedSystems;
  ledger = supportedSystems;
  libtool = supportedSystems;
  libxml2 = supportedSystems;
  libxslt = supportedSystems;
  lzip = supportedSystems;
  manpages = supportedSystems;
  maude = supportedSystems;
  maxima = supportedSystems;
  mercurial = supportedSystems;
  miniHttpd = supportedSystems;
  mpack = supportedSystems;
  mpg123 = supportedSystems;
  mplayer = supportedSystems;
  nbd = supportedSystems;
  ncftp = supportedSystems;
  ncurses = supportedSystems;
  nixops = supportedSystems;
  nixpkgs-lint = supportedSystems;
  nix-repl = supportedSystems;
  openjdk = supportedSystems;
  openssl = supportedSystems;
  p7zip = supportedSystems;
  patchelf = supportedSystems;
  pdsh = supportedSystems;
  pinta = supportedSystems;
  procmail = supportedSystems;
  python3 = supportedSystems;
  python = supportedSystems;
  qemu = supportedSystems;
  rcs = supportedSystems;
  rPackages.data_table = supportedSystems;
  rPackages.Defaults = supportedSystems;
  rPackages.digest = supportedSystems;
  rPackages.doParallel = supportedSystems;
  rPackages.fishmethods = supportedSystems;
  rPackages.foreach = supportedSystems;
  rPackages.memoise = supportedSystems;
  rPackages.plan = supportedSystems;
  rPackages.RSQLite = supportedSystems;
  rPackages.xtable = supportedSystems;
  rtorrent = supportedSystems;
  rWrapper = supportedSystems;
  saneBackends = supportedSystems;
  sqliteInteractive = supportedSystems;
  stellarium = supportedSystems;
  subversion = supportedSystems;
  telnet = supportedSystems;
  texLiveFull = supportedSystems;
  tightvnc = supportedSystems;
  tkgate = supportedSystems;
  tree = supportedSystems;
  unetbootin = supportedSystems;
  utillinuxCurses = supportedSystems;
  wdiff = supportedSystems;
  wget = supportedSystems;
  which = supportedSystems;
  wxmaxima = supportedSystems;
  xautolock = supportedSystems;
  xdg_utils = supportedSystems;
  xfig = supportedSystems;
  xlibs.xauth = supportedSystems;
  xlibs.xev = supportedSystems;
  xlibs.xmessage = supportedSystems;
  xlibs.xmodmap = supportedSystems;
  xlibs.xwininfo = supportedSystems;
  xlsfonts = supportedSystems;
  xmlto = supportedSystems;
  xpdf = supportedSystems;
  xsane = supportedSystems;
  xxdiff = supportedSystems;
  youtubeDL = supportedSystems;
  zlib = supportedSystems;

}
