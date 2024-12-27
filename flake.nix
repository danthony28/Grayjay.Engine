{
	description = "Grayjay's core engine";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	};

	outputs = {
		self,
		nixpkgs,
	}: let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
		fetchNupkg = pkgs.dotnetCorePackages.fetchNupkg;

		sourceRepo =
			pkgs.fetchFromGitHub {
				owner = "futo-org";
				repo = "Grayjay.Engine";
				rev = "130bdd8b4a7f16cacb6785f34869890abdc16079";
				hash = "sha256-++PRqdq/KYIfWcqp+B5qlIPwDuuCp8BycCM4NhGh1uA=";
			};
	in {
		packages.${system}.default = let
		in
			pkgs.buildDotnetModule {
				name = "grayjay-engine";

				projectFile = ./Grayjay.Engine/Grayjay.Engine.csproj;

				# projectReferences = [
				# 	(fetchNupkg {
				# 		pname = "Fizzler.Systems.HtmlAgilityPack";
				# 		version = "1.2.1";
				# 		hash = "sha256-ov8Kc3nBcRxk0I+WPR11QFlD1607ck31M+37SjIElbc=";
				# 	})
				# 	(fetchNupkg {
				# 		pname = "HtmlAgilityPack";
				# 		version = "1.11.58";
				# 		hash = "sha256-VCrBPH6Waw3LmZEKStBSd5uSH2vicndwYazYX6IdnYE=";
				# 	})
				# 	(fetchNupkg {
				# 		pname = "Microsoft.ClearScript.V8";
				# 		version = "7.4.5";
				# 		hash = "sha256-MXl1n1RF6z95IbpXmSGAwraP8EpvPli16ySFGfc/ZxY=";
				# 	})
				# 	(fetchNupkg {
				# 		pname = "System.Text.Json";
				# 		version = "9.0.0";
				# 		hash = "sha256-aM5Dh4okLnDv940zmoFAzRmqZre83uQBtGOImJpoIqk=";
				# 	})
				# ];

				src = "${sourceRepo}/Grayjay.Engine";
				dotnetInstallPath = "$out/lib";

				meta = {
					description = "Grayjay's core engine";
				};
			};
	};
}
