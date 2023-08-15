terraform {
  required_providers {
    thousandeyes = {
      source = "thousandeyes/thousandeyes"
      version = ">= 2.0.0"
    }
  }
}

provider "thousandeyes" {
  token            = "01ab-4520e42d-544b-4942-9736-2402a6af27e4"
  account_group_id = "281474976711473"
}
data "thousandeyes_account_group" "dwoellga_ag" {
  name = "DWOELLHA - Meraki Beta"
}

data "thousandeyes_agent" "arg_cordoba" {
  agent_name = "Cordoba, Argentina"
}

resource "thousandeyes_http_server" "www_thousandeyes_http_test" {
  test_name      = "Example HTTP test set from Terraform provider"
  interval       = 120
  alerts_enabled = false

  url = "https://www.thousandeyes.com"

  agents {
    agent_id = data.thousandeyes_agent.arg_cordoba.agent_id
  }
}