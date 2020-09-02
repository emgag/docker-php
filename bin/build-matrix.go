package main

import (
	"encoding/json"
	"fmt"
	"os"
	"strings"
)

var version = map[string]string{
	"7.2.33": "alpha1",
	"7.3.21": "alpha1",
	"7.4.9":  "alpha1",
}

func main() {

	matrix := struct {
		Upstream []string            `json:"upstream"`
		Flavour  []string            `json:"flavour"`
		Include  []map[string]string `json:"include"`
	}{}

	matrix.Upstream = func() []string {
		v := []string{}
		for k := range version {
			v = append(v, k)
		}
		return v
	}()

	matrix.Flavour = []string{"cli", "fpm"}
	matrix.Include = []map[string]string{}

	for _, upstream := range matrix.Upstream {
		upstream_semver := strings.Split(upstream, ".")

		for _, flavour := range matrix.Flavour {
			revision := ""

			if version[upstream] != "" {
				revision = fmt.Sprintf("-%s", version[upstream])
			}

			matrix.Include = append(
				matrix.Include,
				map[string]string{
					"upstream":       upstream,
					"flavour":        flavour,
					"revision":       revision,
					"upstream_major": upstream_semver[0],
					"upstream_minor": upstream_semver[1],
					"upstream_patch": upstream_semver[2],
				},
			)

		}
	}

	fmt.Print("::set-output name=matrix::")
	json.NewEncoder(os.Stdout).Encode(matrix)
}
