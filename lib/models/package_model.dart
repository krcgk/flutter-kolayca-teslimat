class Package {
  String id;
  String typeName;
  String status;
  double price;
  String receiver;
  String sender;
  String? receiverAddress;
  String? senderAddress;
  String? description;

  Package({
    required this.id,
    required this.status,
    required this.typeName,
    required this.price,
    required this.sender,
    required this.receiver,
    this.description,
    this.receiverAddress,
    this.senderAddress,
  });
}
