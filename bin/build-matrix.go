package main

import (
	"encoding/json"
	"fmt"
	"os"
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
		Build    []string            `json:"build"`
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
	matrix.Build = []string{"base", "build"}
	matrix.Include = []map[string]string{}

	for _, upstream := range matrix.Upstream {
		for _, flavour := range matrix.Flavour {
			for _, build := range matrix.Build {
				revision := ""

				if version[upstream] != "" {
					revision = fmt.Sprintf("-%s", version[upstream])
				}

				suffix := ""

				if build != "base" {
					suffix = fmt.Sprintf("-%s", build)
				}

				matrix.Include = append(
					matrix.Include,
					map[string]string{
						"upstream": upstream,
						"flavour":  flavour,
						"build":    build,
						"revision": revision,
						"suffix":   suffix,
					},
				)

			}
		}
	}

	fmt.Print("::set-output name=matrix::")
	json.NewEncoder(os.Stdout).Encode(matrix)
}
