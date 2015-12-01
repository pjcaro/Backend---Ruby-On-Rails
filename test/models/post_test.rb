require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Crear un post" do
  	post = Post.create(titulo: "titulo", contenido: "Contenido")
  	assert post.save
  end
  test "Actualizar un post" do
  	post = posts(:primer_articulo)
  	assert post.update(titulo: "nuevo titulo", contenido: "nueva contenido")

  end
  test "encontrar un post por su id" do
  	post_id = posts(:primer_articulo).id
  	assert_nothing_raised {Post.find(post_id)}
  	#post = Post.find(post_id)
  	#assert_equal post, posts(:primer_articulo), "no encontro el registro"
  end
  test "debe borrar un post" do
  	post = posts(:primer_articulo)
  	post.destroy
  	assert_raise(ActiveRecord::RecordNotFound) {Post.find(post.id)}
  end

  test "no debe crear post sin titulo" do
  	post = Post.new
  	assert post.invalid?, "el post deberia ser invalido" 
  end

  test "cada titulo tiene que ser unico" do
  	post = Post.new
  	post.titulo = posts(:primer_articulo).titulo
  	assert post.invalid? "dos posts no pueden tener el mismo titulo"
  end

end
