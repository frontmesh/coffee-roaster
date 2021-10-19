let s = React.string;
let style = ReactDOMRe.Style.make;

let px_of_float = x => x->int_of_float->string_of_int ++ "px";
let px_of_int = x => x->string_of_int ++ "px";

[@bs.val] external requireCSS: string => unit = "require";
[@bs.val] external requireImage: string => string = "require";
