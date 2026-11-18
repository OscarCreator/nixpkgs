{
  lib,
  python3Packages,
  buildPythonPackage,
  fetchPypi,
  setuptools
}:

buildPythonPackage (finalAttrs: {
  pname = "mypy-gitlab-code-quality";
  version = "1.3.0";
  pyproject = true;

  src = fetchPypi {
    pname = "mypy_gitlab_code_quality";
    inherit (finalAttrs) version;
    hash = "sha256-huMmd9vJLXvuuF0ep+R/jaegqQOVnragyj9gvwMlymA=";
  };

  build-system = with python3Packages; [ setuptools ];

  # No tests
  doCheck = false;

  pythonImportsCheck = [ "mypy_gitlab_code_quality" ];

  meta = {
    description = "Simple script to generate gitlab code quality report from output of mypy";
    mainProgram = "mypy-gitlab-code-quality";
    homepage = "https://github.com/soul-catcher/mypy-gitlab-code-quality";
    changelog = "https://github.com/soul-catcher/mypy-gitlab-code-quality/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.mit;
  };
})
