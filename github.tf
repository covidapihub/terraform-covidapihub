module "github" {
  source = "./modules/github"

  administrators = [
    "chrisbsmith",
    "kaitmore",
    "dontlaugh",
    "hiromis",
    "justincely",
  ]

  members = [
  ]

  repositories = [
    "datasource-inshift",
    "terraform-covidapihub",
  ]
}
