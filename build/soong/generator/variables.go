package generator

import (
	"fmt"

	"android/soong/android"
)

func faospExpandVariables(ctx android.ModuleContext, in string) string {
	faospVars := ctx.Config().VendorConfig("faospVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if faospVars.IsSet(name) {
			return faospVars.String(name), nil
		}
		// This variable is not for us, restore what the original
		// variable string will have looked like for an Expand
		// that comes later.
		return fmt.Sprintf("$(%s)", name), nil
	})

	if err != nil {
		ctx.PropertyErrorf("%s: %s", in, err.Error())
		return ""
	}

	return out
}
