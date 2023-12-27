use "collections"


class Obj
  """
  JsonObject Builder

  ```pony
  let json_object = Obj("key", 14.5)("another-one", Obj("nested", None)).build()
  ```
  """
  var data: Map[String, JsonType] trn

  new iso create() =>
    data = Map[String, JsonType].create(4)

  fun ref apply(key: String, value: JsonType): Obj =>
    data(key) = value
    consume this

  fun ref build(): JsonObject =>
    JsonObject(this.data = Map[String, JsonType])


class Arr
  """
  JsonArray Builder

  ```pony
  let json_array = Array("key")(14.5)(Obj("nested", None)).build()
  ```
  """
  var data: Array[JsonType] trn

  new iso create() =>
    data = Array[JsonType].create(4)

  fun ref apply(elem: JsonType): Arr =>
    data.push(elem)
    consume this

  fun ref build(): JsonArray =>
    JsonArray(this.data = Array[JsonType].create(0))

