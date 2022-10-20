package main

import (
	"net"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func isValidIPAddress(ip string) bool {
	return net.ParseIP(ip) != nil
}

func TestTerraform(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../terraform",
		Vars: map[string]interface{}{
			"server_name": "terratest",
			"server_size": "small",
		},
	})
	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	publicIP := terraform.Output(t, terraformOptions, "public_ip")
	isValidIP := isValidIPAddress(publicIP)
	assert.Equal(t, isValidIP, true)
}
