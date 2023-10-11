{ lib
, buildPythonPackage
, fetchFromGitHub
, hatchling
, numpy
, typeguard
, typing-extensions
, cloudpickle
, equinox
, jax
, jaxlib
, torch
, pytestCheckHook
}:

let
  self = buildPythonPackage rec {
    pname = "jaxtyping";
    version = "0.2.23";
    pyproject = true;

    src = fetchFromGitHub {
      owner = "google";
      repo = "jaxtyping";
      rev = "refs/tags/v${version}";
      hash = "sha256-22dIuIjFgqRmV9AQok02skVt7fm17/WpzBm3FrJ6/zs=";
    };

    nativeBuildInputs = [
      hatchling
    ];

    propagatedBuildInputs = [
      numpy
      typeguard
      typing-extensions
    ];

    nativeCheckInputs = [
      cloudpickle
      equinox
      jax
      jaxlib
      pytestCheckHook
      torch
    ];

    doCheck = false;

    # Enable tests via passthru to avoid cyclic dependency with equinox.
    passthru.tests = {
      check = self.overridePythonAttrs { doCheck = true; };
    };

    pythonImportsCheck = [ "jaxtyping" ];

    meta = with lib; {
      description = "Type annotations and runtime checking for JAX arrays and PyTrees";
      homepage = "https://github.com/google/jaxtyping";
      license = licenses.mit;
      maintainers = with maintainers; [ GaetanLepage ];
    };
  };
 in self
