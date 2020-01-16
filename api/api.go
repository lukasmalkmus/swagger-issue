package api

import "github.com/lukasmalkmus/swagger-issue/models"

// swagger:model Data
type Data struct {
	models.Data
}

// swagger:route GET /data Data data
// Lists all data.
// responses:
//  200: Data
func datasets() Data {
	return Data{ID: "123-abc"}
}
