open MaterialUi
open Utils

module HeaderStyles = %makeStyles(
  theme => {
    appBar: style(
      ~zIndex=(theme.zIndex.drawer +. 1.0)->int_of_float->string_of_int,
      ~transition=ThemeHelpers.transitionCreate(
        ~theme,
        ~affectWidth=true,
        ~affectMargin=true,
        ~easing=theme.transitions.easing.sharp,
        ~duration=theme.transitions.duration.leavingScreen,
        (),
      ),
      (),
    ),
    title: style(~flexGrow="1", ()),
    menuButton: style(~marginRight="36px", ()),
    toolbar: style(~paddingRight="24px", ()) /* keep right padding when drawer closed */,
    content: style(~flexGrow="1", ~height="100vh", ~overflow="auto", ()),
    appBarSpacer: theme.mixins.toolbar,
  }
)

@react.component
let make = () => {
  let classes = HeaderStyles.useStyles()

  <AppBar className=classes.appBar>
    <Toolbar className=classes.toolbar>
      <IconButton color=#Inherit className=classes.menuButton>
        <MscharleyBsMaterialUiIcons.Menu.Filled />
      </IconButton>
      <Typography
        component={Typography.Component.string("h1")}
        variant=#H6
        color=#Inherit
        noWrap=true
        className=classes.title>
        {"Coffee Roasting Co."->s}
      </Typography>
    </Toolbar>
  </AppBar>
}
