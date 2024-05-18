{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  pywalfox_wrapper = pkgs.writeShellScriptBin "pywalfox_wrapper" ''
    ${pkgs.pywalfox-native}/bin/pywalfox start
  '';
in {
  home.packages = with pkgs; [
    pywal
    pywalfox-native
  ];
  home.file = mkIf config.firefox.enable {
    ".mozilla/native-messaging-hosts/pywalfox.json".text =
      builtins.replaceStrings ["<path>"]
      ["${pywalfox_wrapper}/bin/pywalfox_wrapper"] (builtins.readFile
        "${pkgs.pywalfox-native}/lib/python3.11/site-packages/pywalfox/assets/manifest.json");
  };
}
