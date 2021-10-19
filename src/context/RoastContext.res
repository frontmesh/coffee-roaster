let context = React.createContext([Roast.init])
let useRoast = () => React.useContext(context)

let roasts: array<Roast.t> = [
  {
    id: Some("1"),
    name: "My Very First Roast",
    roaster: GeneCoffeeCBR1,
    createdAt: Some("2021-02-28T16:28:13.643Z"),
    beans: "Uganda",
    time: 17,
    temp: 245,
    roomTemp: Some(25),
    sourness: Some(5),
    bitterness: Some(2),
    sweetness: Some(2),
    roastType: Some(City),
    success: Some(true),
  },
  {
    id: Some("2"),
    name: "My Very Second Roast",
    roaster: GeneCoffeeCBR1,
    createdAt: Some("2021-02-28T16:28:13.643Z"),
    beans: "Cuba Serano Lavado",
    time: 13,
    temp: 245,
    roomTemp: Some(25),
    sourness: Some(5),
    bitterness: Some(2),
    sweetness: Some(2),
    roastType: Some(Dark),
    success: Some(true),
  },
]

module Provider = {
  let provider = React.Context.provider(context)

  @react.component
  let make = (~value, ~children) => {
    React.createElement(
      provider,
      {
        "value": value,
        "children": children,
      },
    )
  }
}
