actor {
  public query func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };
  public func hello(name: Text): async Text {
    return "Halo, " # name # " dari Motoko!";
  };
};
