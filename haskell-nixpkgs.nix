/* Essential Haskell packages in Nixpkgs that must build. */

{ supportedSystems ? [ "x86_64-linux" ] }:

with (import <nixpkgs/pkgs/top-level/release-lib.nix> { inherit supportedSystems; });

let

  linux = import <nixpkgs/pkgs/top-level/release-lib.nix> { supportedSystems = [ "i686-linux" "x86_64-linux" ]; };

  ghc6104 = "ghc6104";
  ghc6123 = "ghc6123";
  ghc704  = "ghc704";
  ghc722  = "ghc722";
  ghc742  = "ghc742";
  ghc763  = "ghc763";
  ghc783  = "ghc783";
  ghcHEAD = "ghcHEAD";
  default = [ ghc783 ];
  all     = [ ghc6104 ghc6123 ghc704 ghc722 ghc742 ghc763 ghc783 ghcHEAD ];

  allBut = platforms: pkgs.lib.filter (x: !(pkgs.lib.elem x platforms)) all;

  filterSupportedSystems = systems: pkgs.lib.filter (x: pkgs.lib.elem x supportedSystems) systems;

  mapHaskellTestOn = attrs: pkgs.lib.mapAttrs mkJobs attrs;

  mkJobs = pkg: ghcs: builtins.listToAttrs (pkgs.lib.concatMap (ghc: mkJob ghc pkg) ghcs);

  mkJob = ghc: pkg:
    let
      pkgPath = ["haskellPackages_${ghc}" "${pkg}"];
      systems = filterSupportedSystems (pkgs.lib.attrByPath (pkgPath ++ ["meta" "platforms"]) [] pkgs);
    in
      map (system: mkSystemJob system ghc pkg) systems;

  mkSystemJob = system: ghc: pkg:
    pkgs.lib.nameValuePair "${ghc}" (pkgs.lib.setAttrByPath [system] ((pkgs.lib.getAttrFromPath ["haskellPackages_${ghc}" "${pkg}"] (pkgsFor system))));

in

linux.mapTestOn {

  haskellPackages.ghcPlain = [ "i686-linux" "x86_64-linux" ];

}
//
mapTestOn {

  cryptol2 = supportedSystems;
  darcs = supportedSystems;
  gitAndTools.gitAnnex = supportedSystems;
  jhc = supportedSystems;

  haskellPlatformPackages."2009_2_0_2" = supportedSystems;
  # haskellPlatformPackages."2010_1_0_0" = supportedSystems;
  haskellPlatformPackages."2010_2_0_0" = supportedSystems;
  #haskellPlatformPackages."2011_2_0_0" = supportedSystems;
  #haskellPlatformPackages."2011_2_0_1" = supportedSystems;
  haskellPlatformPackages."2011_4_0_0" = supportedSystems;
  haskellPlatformPackages."2012_2_0_0" = supportedSystems;
  haskellPlatformPackages."2012_4_0_0" = supportedSystems;
  haskellPlatformPackages."2013_2_0_0" = supportedSystems;

  #haskellPackages_ghc763 = packagesWithMetaPlatform pkgs.haskellPackages_ghc763;
  #haskellPackages_ghc783 = packagesWithMetaPlatform pkgs.haskellPackages_ghc783;

}
//
mapHaskellTestOn {

  abstractPar = default;
  ACVector = default;
  aeson = default;
  alex = all;
  alsaCore = default;
  alsaPcm = default;
  ansiTerminal = default;
  ansiWlPprint = default;
  asn1Data = default;
  async = allBut [ghc6104 ghc6123];
  attempt = default;
  attoparsec = allBut [ghc6104 ghcHEAD];
  attoparsecEnumerator = default;
  authenticate = default;
  base64Bytestring = default;
  baseUnicodeSymbols = default;
  benchpress = default;
  bimap = default;
  binaryShared = default;
  bitmap = default;
  bktrees = default;
  blazeBuilder = default;
  blazeBuilderEnumerator = default;
  blazeHtml = default;
  blazeTextual = default;
  bmp = default;
  BNFC = default;
  Boolean = default;
  bytestringMmap = default;
  bytestringNums = default;
  bytestringTrie = default;
  Cabal_1_14_0 = [ ghc6104 ghc6123 ghc704 ];
  Cabal_1_16_0_3 = [ ghc6104 ghc6123 ghc704 ghc722 ghc742 ghc763 ];
  Cabal_1_18_1_3 = [ ghc704 ghc722 ghc742 ghc763 ghc783 ];
  Cabal_1_20_0_2 = [ ghc722 ghc742 ghc763 ghc783 ];
  cabal2Ghci = default;
  cabal2nix = allBut [ghc6104];
  cabalGhci = default;
  cabalInstall_1_20_0_3 = allBut [ ghc6104 ghc6123 ghc704 ];
  cabalInstall = all;
  cairo = default;
  caseInsensitive = all;
  cautiousFile = default;
  cereal = default;
  certificate = default;
  Chart = default;
  citeprocHs = default;
  clientsession = default;
  cmdargs = default;
  cmdlib = allBut [ghc6104 ghcHEAD];
  colorizeHaskell = default;
  colour = default;
  comonadsFd = default;
  conduit = default;
  ConfigFile = default;
  continuedFractions = default;
  converge = default;
  convertible = default;
  cookie = default;
  cpphs = all;
  cprngAes = default;
  criterion = default;
  dataMemocombinators = all;
  cryptoApi = default;
  cryptocipher = default;
  Crypto = default;
  cryptohash = default;
  cssText = default;
  csv = default;
  dataAccessor = default;
  dataAccessorTemplate = default;
  dataDefault = default;
  dataenc = default;
  dataReify = default;
  datetime = default;
  DAV = default;
  dbus = default;
  derive = default;
  diagrams = default;
  Diff = default;
  digest = default;
  digestiveFunctorsHeist = default;
  digestiveFunctorsSnap = default;
  dimensional = default;
  dimensionalTf = default;
  directoryTree = default;
  dlist = default;
  dns = default;
  doctest = allBut [ghc6104 ghc6123];
  dotgen = default;
  doubleConversion = default;
  editDistance = default;
  emailValidate = default;
  entropy = default;
  enumerator = default;
  erf = default;
  failure = default;
  fclabels = default;
  feed = default;
  fgl = allBut [ghcHEAD];
  fileEmbed = default;
  filestore = default;
  fingertree = default;
  flexibleDefaults = default;
  fsnotify = default;
  funcmp = all;
  gamma = default;
  gdiff = default;
  ghc = all;
  ghcEvents = default;
  ghcMod = default;
  ghcMtl = default;
  ghcPaths = all;
  ghcSybUtils = default;
  githubBackup = default;
  github = default;
  gitit = [ghc763];
  glade = default;
  glib = default;
  Glob = default;
  GLUT = all;
  gnutls = default;
  graphviz = default;
  gtk = default;
  gtksourceview2 = default;
  hackageDb = all;
  haddock = allBut [ghc722 ghcHEAD];
  hakyll = default;
  hamlet = default;
  happstackHamlet = default;
  happstackServer = default;
  happy = all;
  hashable = default;
  hashtables = all;
  hashedStorage = default;
  haskeline = default;
  haskellLexer = default;
  haskellSrc = all;
  haskellSrcExts = default;
  haskellSrcMeta = default;
  HaXml = default;
  haxr = default;
  HDBC = default;
  HDBCPostgresql = default;
  HDBCSqlite3 = default;
  highlightingKate = default;
  hinotify = default;
  hint = default;
  hledger = default;
  hledgerInterest = default;
  hledgerLib = default;
  hledgerWeb = default;
  hlint = default;
  HList = default;
  hmatrix = default;
  hoogle = default;
  hopenssl = all;
  hostname = default;
  hp2anyCore = default;
  hp2anyGraph = default;
  hS3 = default;
  hscolour = default;
  hsdns = all;
  hsemail = allBut [ghc6104 ghc6123];
  hslogger = default;
  hsloggerTemplate = default;
  hspec = default;
  HsSyck = default;
  HStringTemplate = default;
  hsyslog = all;
  html = all;
  HTTP = all;
  httpConduit = default;
  httpDate = default;
  httpdShed = default;
  httpTypes = default;
  HUnit = all;
  hxt = default;
  idris = default;
  IfElse = all;
  irc = default;
  iteratee = default;
  jailbreakCabal = all;
  jhc = all;
  json = default;
  jsonTypes = default;
  keter = default;
  LambdaHack = default;
  languageCQuote = default;
  languageJavascript = default;
  largeword = default;
  lens = default;
  libxmlSax = default;
  liftedBase = default;
  ListLike = default;
  logfloat = default;
  mainlandPretty = default;
  maude = default;
  MaybeT = default;
  MemoTrie = default;
  mersenneRandomPure64 = default;
  mimeMail = default;
  MissingH = default;
  mmap = default;
  MonadCatchIOMtl = default;
  MonadCatchIOTransformers = default;
  monadControl = default;
  monadLoops = allBut [ghc6104];
  monadPar = allBut [ghc6104 ghcHEAD];
  MonadPrompt = default;
  MonadRandom = default;
  mpppc = default;
  mtl = all;
  mtlparse = default;
  multiplate = default;
  multirec = default;
  murmurHash = default;
  mwcRandom = default;
  nat = default;
  nats = allBut [ghc6104 ghc6123];
  naturals = default;
  ncurses = default;
  network = all;
  networkInfo = default;
  networkMulticast = default;
  networkProtocolXmpp = default;
  nonNegative = default;
  numericPrelude = default;
  numtype = default;
  numtypeTf = default;
  ObjectName = default;
  OneTuple = default;
  OpenAL = default;
  OpenGL = all;
  optparseApplicative = default;
  packunused = default;
  pandoc = default;
  pandocTypes = default;
  pango = default;
  parallel = all;
  parseargs = default;
  parsec = all;
  parsimony = default;
  pathPieces = default;
  pathtype = default;
  pcreLight = default;
  permutation = all;
  persistent = default;
  persistentPostgresql = default;
  persistentSqlite = default;
  persistentTemplate = default;
  polyparse = all;
  ppm = default;
  prettyShow = default;
  primitive = all;
  PSQueue = default;
  pureMD5 = default;
  pwstoreFast = default;
  QuickCheck2 = default;
  QuickCheck = all;
  random = default;
  randomFu = default;
  randomShuffle = default;
  randomSource = default;
  RangedSets = default;
  ranges = default;
  readline = default;
  recaptcha = default;
  regexBase = all;
  regexCompat = all;
  regexPCRE = default;
  regexPosix = all;
  regexpr = default;
  regexTDFA = allBut [ghc6104];
  regular = default;
  RSA = default;
  rvar = default;
  safe = default;
  scientific = allBut [ghc6104 ghc6123 ghcHEAD];
  semigroups = default;
  sendfile = default;
  SHA = default;
  shake = default;
  Shellac = default;
  shelly = default;
  simpleSendfile = default;
  smallcheck = default;
  SMTPClient = default;
  snapCore = default;
  snap = default;
  snapLoaderStatic = default;
  snapServer = default;
  split = all;
  splot = default;
  srcloc = default;
  stateref = default;
  StateVar = default;
  statistics = default;
  stbImage = default;
  stm = all;
  storableComplex = default;
  storableRecord = default;
  streamproc = all;
  strict = default;
  strptime = default;
  svgcairo = default;
  syb = allBut [ghc6104 ghc6123];
  sybWithClass = default;
  sybWithClassInstancesText = default;
  systemFileio = allBut [ghcHEAD];
  systemFilepath = allBut [ghcHEAD];
  tabular = default;
  tagged = default;
  tagsoup = default;
  tar = all;
  terminfo = default;
  testFramework = default;
  testFrameworkHunit = default;
  texmath = default;
  text = all;
  thLift = default;
  thyme = default;
  tls = default;
  transformersBase = default;
  transformersCompat = default;
  transformers = [ ghc6104 ghc6123 ghc704 ghc722 ghc742 ghc763 ];
  trifecta = default;
  tuple = default;
  typeLevelNaturalNumber = default;
  uniplate = default;
  unixCompat = default;
  unixTime = allBut [ghc6104 ghc6123];
  unorderedContainers = default;
  url = default;
  utf8Light = default;
  utf8String = default;
  utilityHt = default;
  uuagc = default;
  uuid = default;
  uulib = default;
  uuOptions = default;
  uuParsinglib = default;
  vcsRevision = default;
  vectorAlgorithms = default;
  vector = all;
  vectorSpace = default;
  vty = default;
  waiAppStatic = default;
  wai = default;
  waiExtra = default;
  waiLogger = default;
  warp = default;
  wlPprint = all;
  wlPprintExtras = default;
  wlPprintTerminfo = default;
  wx = default;
  X11 = default;
  xhtml = all;
  xmlConduit = default;
  xml = default;
  xmlHamlet = default;
  xmlTypes = default;
  xmobar = default;
  xmonadContrib = default;
  xmonad = default;
  xmonadExtras = default;
  xssSanitize = default;
  yesodAuth = default;
  yesodCore = default;
  yesod = default;
  yesodDefault = default;
  yesodForm = default;
  yesodJson = default;
  yesodPersistent = default;
  yesodStatic = default;
  zeromq3Haskell = default;
  zeromqHaskell = default;
  zipArchive = default;
  zipper = default;
  zlib = all;
  zlibBindings = default;
  zlibEnum = default;

}
