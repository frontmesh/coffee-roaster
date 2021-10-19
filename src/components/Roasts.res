open MaterialUi
open Utils

module RoastsStyles = %makeStyles(
  theme => {
    seeMore: style(~marginTop=theme.spacing(3)->px_of_int, ()),
  }
)

@react.component
let make = () => {
  let classes = RoastsStyles.useStyles()
  let roasts = React.useContext(RoastContext.context)
  <>
    <Typography
      component={Typography.Component.string("h2")} variant=#H6 color=#Primary gutterBottom=true>
      {"Recent Roasts"->s}
    </Typography>
    <Table>
      <TableHead>
        <TableRow>
          <TableCell> {"Name"->s} </TableCell>
          <TableCell> {"Roaster"->s} </TableCell>
          <TableCell> {"Beans"->s} </TableCell>
          <TableCell> {"Time"->s} </TableCell>
          <TableCell> {"Temp"->s} </TableCell>
          <TableCell> {"Type"->s} </TableCell>
          <TableCell> {"Succes"->s} </TableCell>
        </TableRow>
      </TableHead>
      <TableBody>
        {Belt.Array.map(roasts, row => {
          <TableRow key={row.id->Belt.Option.getWithDefault("")}>
            <TableCell> {row.name} </TableCell>
            <TableCell> {row.roaster} </TableCell>
            <TableCell> {row.beans} </TableCell>
            <TableCell> {row.time} </TableCell>
            <TableCell> {row.temp} </TableCell>
            <TableCell> {row.roastType->Roast.getRoastType} </TableCell>
            <TableCell> {row.success} </TableCell>
          </TableRow>
        })}
      </TableBody>
    </Table>
    <div className={classes.seeMore}>
      <Link color=#Primary href="#"> {"See more roasts"->s} </Link>
    </div>
  </>
}
