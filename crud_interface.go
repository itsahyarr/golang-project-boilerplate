package x

type Crudinterface interface {
	Create(model *any, opts ...any) (any, error)

	GetAll(opts ...any) ([]any, error)

	// id can be int or string
	GetById(id int, opts ...any) (any, error)

	UpdateById(id int, opts ...any) (any, error)

	DeleteById(id int, opts ...any) error
}
