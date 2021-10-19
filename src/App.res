@react.component
let make = () => {
  let (state, dispatch) = React.useReducer(RoastDispatchContext.reducer, RoastContext.roasts)

  <RoastContext.Provider value=state>
    <RoastDispatchContext.Provider value=dispatch> <Page /> </RoastDispatchContext.Provider>
  </RoastContext.Provider>
}
