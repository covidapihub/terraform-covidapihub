resource "aws_vpc_peering_connection" "peering" {
  peer_vpc_id   = var.to_vpc
  vpc_id        = var.from_vpc
  auto_accept   = true

  tags = {
    Name = "Peering from ${var.from_vpc} to ${var.to_vpc}"
  }
}
