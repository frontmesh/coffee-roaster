type t =
  | Home
  | NotFound;

let fromUrl =
  fun
  | [] => Home
  | _ => NotFound;

let toUrl =
  fun
  | Home => "/"
  | NotFound => "/404";

let push = route => route |> toUrl |> ReasonReactRouter.push;

let isActive = (url: ReasonReactRouter.url, route) => {
  let activeRoute = url.path |> fromUrl;
  route == activeRoute;
};
