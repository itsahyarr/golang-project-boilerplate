run:
	go run cmd/main.go

.ONESHELL:
module:
	# make module directory
	mkdir -p internal/$(name)

	# make handler file
	cat <<- EOF > "internal/$(name)/$(name)_router.go"
	package $(name)

	type $(name)Router struct {
		Handler *$(name)Handler
	}

	func NewRouter(h *$(name)Handler) *$(name)Router {
		return &$(name)Router{
			Handler: h,
		}
	}

	func (r *$(name)Router) Register(app *fiber.App) {

		// route := app.Group("/example")
		// route.Post("/send", r.Handler.SendTextMessage)
	} 
	EOF

	# make router file
	cat <<- EOF > "internal/$(name)/$(name)_handler.go"
	package $(name)
	
	type $(name)Handler struct {
		Repository $(name)Repository
	}

	func NewHandler(r $(name)Repository) *$(name)Handler {
		return &$(name)Handler{
			Repository: r,
		}
	}

	EOF

	# make repository file (interface)
	cat <<- EOF > "internal/$(name)/$(name)_repository.go"
	package $(name)

	type $(name)Repository interface{
		Create()
		GetAll()
		GetById()
		UpdateById()
		DeleteById()
	}

	EOF
	
	# make repository file (implementation)
	cat <<- EOF > "internal/$(name)/$(name)_repository_impl.go"
	package $(name)

	type $(name)RepositoryImpl struct {
		Db *mongo.Database
	}

	func New$(name)Repository(db *mongo.Database) $(name)Repository {
		return &$(name)RepositoryImpl{Db: db}
	}

	EOF

	# make models file
	cat <<- EOF > "internal/$(name)/$(name)_models.go"
	package $(name)

	type $(name)Model struct {
		ExampleField string \`json:"exampleField"\`
	}

	EOF
	

