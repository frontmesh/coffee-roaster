open MaterialUi
open Utils

module PageStyles = %makeStyles(
  theme => {
    container: style(
      ~paddingTop=theme.spacing(4)->px_of_int,
      ~paddingBottom=theme.spacing(4)->px_of_int,
      (),
    ),
    paper: style(
      ~padding=theme.spacing(2)->px_of_int,
      ~display="flex",
      ~overflow="auto",
      ~flexDirection="column",
      (),
    ),
  }
)

@react.component
let make = () => {
  // open Utils
  let classes = PageStyles.useStyles()
  <Container maxWidth=MaterialUi_Container.MaxWidth.lg className={classes.container}>
    <Grid container=true spacing=#V3 />
    <Grid item=true xs={MaterialUi.Grid.Xs._12}>
      <Paper className={classes.paper}> <Roasts /> </Paper>
    </Grid>
  </Container>
}
