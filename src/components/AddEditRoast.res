open MaterialUi
open Utils

module AddEditRoastStyles = %makeStyles(
  theme => {
    paper: style(
      ~backgroundColor=theme.palette.background.paper,
      ~border="2px solid #FFF",
      ~boxShadow=theme.shadows[5],
      ~padding=theme.spacing(4)->px_of_int,
      ~outline="none",
      ~width="60%",
      (),
    ),
    selectField: style(~justifyContent="center", ~marginTop=theme.spacing(2)->px_of_int, ()),
    button: style(~display="flex", ~marginTop=theme.spacing(2)->px_of_int, ()),
    root: style(~margin=theme.spacing(1)->px_of_int, ()),
  }
)

type field = {hasErrors: bool, message: string}

type validationState = {
  nameField: field,
  roasterTypeField: field,
  beansField: field,
  roastTimeField: field,
  maxTempField: field,
}

type state = {
  name: string,
  roasterType: string,
  beans: string,
  roastTime: string,
  maxTemp: string,
}

let fieldInitState = {
  hasErrors: false,
  message: "",
}

let hasErrorsInitState = {
  nameField: fieldInitState,
  roasterTypeField: fieldInitState,
  beansField: fieldInitState,
  roastTimeField: fieldInitState,
  maxTempField: fieldInitState,
}

let requiredMessage = "This field is required."

let requiredMessageError = {hasErrors: true, message: requiredMessage}

let validateFields = vals =>
  switch vals {
  | {name: ""} => {...hasErrorsInitState, nameField: requiredMessageError}
  // | {roasterType: ""} => {
  //     ...hasErrors,
  //     roasterTypeField: requiredMessageError,
  //   }
  | {beans: ""} => {...hasErrorsInitState, beansField: requiredMessageError}
  | {roastTime: ""} => {...hasErrorsInitState, roastTimeField: requiredMessageError}
  | {maxTemp: ""} => {...hasErrorsInitState, maxTempField: requiredMessageError}
  | _ => hasErrorsInitState
  }

@react.component
let make = (~_open, ~handleOnClose) => {
  let classes = AddEditRoastStyles.useStyles()
  let (hasErrors, setHasErrors) = React.useReducer((_, v) => v, hasErrorsInitState)
  let (values: state, setValues) = React.useReducer(
    (_, v) => v,
    {
      name: "",
      roasterType: "",
      beans: "",
      roastTime: "",
      maxTemp: "",
    },
  )

  let handleChangeName = (e: ReactEvent.Form.t) =>
    setValues({...values, name: ReactEvent.Form.target(e)["value"]})
  let handleChangeBeans = (e: ReactEvent.Form.t) =>
    setValues({...values, beans: ReactEvent.Form.target(e)["value"]})
  let handleChangeRoastTime = (e: ReactEvent.Form.t) =>
    setValues({...values, roastTime: ReactEvent.Form.target(e)["value"]})
  let handleChangeMaxTemp = (e: ReactEvent.Form.t) =>
    setValues({...values, maxTemp: ReactEvent.Form.target(e)["value"]})

  let errorHandler = field =>
    switch field {
    | {hasErrors: true, message} => <FormHelperText> {message->s} </FormHelperText>
    | _ => <> </>
    }

  let handleSubmit = _ => {
    let validatedFields = values->validateFields
    Js.log(validatedFields)
    setHasErrors(validatedFields)
  }

  <Modal
    _open
    onClose=handleOnClose
    style={style(~display="flex", ~alignItems="center", ~justifyContent="center", ())}>
    <Fade _in={_open}>
      <div className={classes.paper}>
        <h2> {"Add Roast"->s} </h2>
        <p> {"Hello this is simple modal"->s} </p>
        <form className={classes.root} autoComplete="off">
          <FormTextField
            label={"Roast Name"}
            value=values.name
            handleOnChange=handleChangeName
            handleError={hasErrors.nameField->errorHandler}
          />
          <Select
            id="roaster-type"
            label={"Roast Type"->s}
            variant=#Outlined
            className=classes.selectField
            fullWidth=true
            value={Select.Value.string(values.roasterType)}>
            <MenuItem value={MenuItem.Value.string("Gene")}>
              <em> {"Gene Coffee CBR-1"->s} </em>
            </MenuItem>
          </Select>
          <FormTextField
            label="Coffee Beans"
            value=values.beans
            handleError={hasErrors.beansField->errorHandler}
            handleOnChange={handleChangeBeans}
          />
          <FormTextField
            label="Roasting Time"
            value=values.roastTime
            handleError={hasErrors.roastTimeField->errorHandler}
            handleOnChange={handleChangeRoastTime}
          />
          <FormTextField
            label="Max Temp"
            value=values.roastTime
            handleError={hasErrors.maxTempField->errorHandler}
            handleOnChange={handleChangeMaxTemp}
          />
          <Button
            variant=#Contained color=#Primary className={classes.button} onClick={handleSubmit}>
            {"Submit"->s}
          </Button>
        </form>
      </div>
    </Fade>
  </Modal>
}
