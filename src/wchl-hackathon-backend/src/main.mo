import Array "mo:base/Array";
import Text "mo:base/Text";
import Principal "mo:base/Principal";

actor {
  type Wallet = {
    id : Text;
    owner : Principal;
    riskScore : Nat;
    category : Text;
  };

  type Analytics = {
    aman : Nat;
    berbahaya : Nat;
    terkait_judol : Nat;
  };

  stable var wallets : [Wallet] = [];

  public func initWallets() : async () {
    wallets := seedDummyWallets();
  };

  func seedDummyWallets() : [Wallet] {
    return [
      {
        id = "wallet-abc123";
        owner = Principal.fromText("aaaaa-aa");
        riskScore = 20;
        category = "aman";
      },
      {
        id = "casino-777";
        owner = Principal.fromText("aaaaa-aa");
        riskScore = 85;
        category = "terkait_judol";
      },
      {
        id = "wallet-scam01";
        owner = Principal.fromText("aaaaa-aa");
        riskScore = 65;
        category = "berbahaya";
      },
      {
        id = "wallet-bet-online";
        owner = Principal.fromText("aaaaa-aa");
        riskScore = 80;
        category = "terkait_judol";
      },
      {
        id = "my-safe-wallet";
        owner = Principal.fromText("aaaaa-aa");
        riskScore = 20;
        category = "aman";
      },
    ];
  };

  public func addWallet(id : Text, owner : Principal) : async () {
    let score = calculateRisk(id);
    let category = classify(score);
    let newWallet : Wallet = {
      id = id;
      owner = owner;
      riskScore = score;
      category = category;
    };
    wallets := Array.append<Wallet>(wallets, [newWallet]);
  };

  public query func getWallets() : async [Wallet] {
    return wallets;
  };

  public query func getAnalytics() : async Analytics {
    var totalAman = 0;
    var totalBerbahaya = 0;
    var totalJudol = 0;

    for (wallet in wallets.vals()) {
      if (wallet.category == "aman") {
        totalAman += 1;
      } else if (wallet.category == "berbahaya") {
        totalBerbahaya += 1;
      } else if (wallet.category == "terkait_judol") {
        totalJudol += 1;
      };
    };

    return {
      aman = totalAman;
      berbahaya = totalBerbahaya;
      terkait_judol = totalJudol;
    };
  };

  public query func analyzeWallet(targetId : Text) : async [Wallet] {
    let maybeTarget = Array.find<Wallet>(wallets, func(w) { w.id == targetId });

    switch (maybeTarget) {
      case (null) {
        return [];
      };
      case (?t) {
        let target : Wallet = t; // cast agar dikenali sebagai Wallet biasa

        let related = Array.filter<Wallet>(
          wallets,
          func(w) {
            w.id != targetId and w.category == target.category
          },
        );

        return Array.append<Wallet>([target], related);
      };
    };
  };

  func calculateRisk(id : Text) : Nat {
    if (
      Text.contains(id, #text "bet") or
      Text.contains(id, #text "casino") or
      Text.contains(id, #text "abc")
    ) {
      return 80;
    };
    return 20;
  };

  func classify(score : Nat) : Text {
    if (score >= 70) {
      return "terkait_judol";
    } else if (score >= 50) {
      return "berbahaya";
    } else {
      return "aman";
    };
  };
};
