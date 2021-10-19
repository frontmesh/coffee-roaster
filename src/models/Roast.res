type roastType = Light | City | FullCity | Dark

type roaster = GeneCoffeeCBR1 | Generic

let getRoastType = roastType =>
  switch roastType {
  | Some(Light) => "Light Roast"
  | Some(City) => "City Roast"
  | Some(FullCity) => "Full City Roast"
  | Some(Dark) => "Dark Roast"
  | None => ""
  }

type t = {
  id: option<string>,
  createdAt: option<string>,
  roaster: roaster,
  name: string,
  beans: string,
  time: int,
  temp: int,
  roomTemp: option<int>,
  sourness: option<int>,
  bitterness: option<int>,
  sweetness: option<int>,
  success: option<bool>,
  roastType: option<roastType>,
}

let init = {
  id: None,
  createdAt: None,
  name: "",
  roaster: GeneCoffeeCBR1,
  beans: "",
  time: 0,
  temp: 0,
  roomTemp: None,
  sourness: None,
  bitterness: None,
  sweetness: None,
  success: None,
  roastType: None,
}
