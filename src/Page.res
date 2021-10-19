open MaterialUi
open Utils

module PageStyles = %makeStyles(
  theme => {
    content: style(~flexGrow="1", ~height="100vh", ~overflow="auto", ()),
    appBarSpacer: theme.mixins.toolbar,
    floatingButton: style(~position="fixed", ~right="50px", ()),
  }
)

@react.component
let make = () => {
  let url = ReasonReactRouter.useUrl()
  let classes = PageStyles.useStyles()
  let (isOpen: bool, setIsOpen) = React.useState(() => false)
  <>
    <CssBaseline />
    <Header />
    <main className={classes.content}>
      <div className={classes.appBarSpacer} />
      {switch url.path |> Route.fromUrl {
      | Home => <HomePage />
      | _ => <NotFound />
      }}
      <MaterialUi_Fab
        color=#Secondary className={classes.floatingButton} onClick={_ => setIsOpen(_ => true)}>
        <MscharleyBsMaterialUiIcons.Add.Filled />
      </MaterialUi_Fab>
      <AddEditRoast _open={isOpen} handleOnClose={(_, _) => setIsOpen(_ => false)} />
    </main>
  </>
}
