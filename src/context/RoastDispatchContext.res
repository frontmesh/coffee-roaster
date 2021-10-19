type roastAction = AddRoast(Roast.t) | DeleteRoast(Roast.t) | GetRoasts

let context = React.createContext((_action: roastAction) => ())

let reducer = (state: array<Roast.t>, action: roastAction) => {
  switch action {
  | AddRoast(roast) => Belt.Array.concat(state, [roast])
  | GetRoasts => state
  | DeleteRoast(roast) => Belt.Array.keep(state, a => a.id != roast.id)
  }
}

module Provider = {
  let provider = React.Context.provider(context)

  @react.component
  let make = (~value, ~children) => {
    React.createElement(provider, {"value": value, "children": children})
  }
}
