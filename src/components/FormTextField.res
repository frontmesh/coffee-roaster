open MaterialUi
open Utils

module FormTextFieldStyles = %makeStyles(
  theme => {
    textField: style(~justifyContent="center", ~marginTop=theme.spacing(2)->px_of_int, ()),
  }
)

@react.component
let make = (~label, ~value, ~handleOnChange, ~handleError) => {
  let classes = FormTextFieldStyles.useStyles()
  <FormControl error=true fullWidth=true>
    <TextField
      id={Js.String.replace(" ", "-", label) ++ "_id"}
      label={label->s}
      variant=#Outlined
      className=classes.textField
      fullWidth=true
      value={TextField.Value.string(value)}
      onChange={handleOnChange}
    />
    {handleError}
  </FormControl>
}
