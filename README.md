# GitHub Action for running pytest-django commands
### Forked from [cclauss/GitHub-Action-for-pytest](https://github.com/cclauss/GitHub-Action-for-pytest) - to utilise the pytest-django module (for Django web apps)

##### Documentation
- [pytest](https://docs.pytest.org/en/6.2.x/contents.html)
- [pytest-django](https://pytest-django.readthedocs.io/en/latest/)
- [GitHub workflow syntax](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)

##### Example workflow file
```
  name: Testing

  on: [pull_request, workflow_dispatch]

  jobs:  
    Testing:
      runs-on: ubuntu-latest

      steps:
        - name: Checkout Repo
          uses: actions/checkout@v2

        - name: Run pytest (pytest-django)
          env:
            PYTHONPATH: webapp/src/
          uses: samwlms/pytest-django-action@1.9
          with:
            args: pytest --ds=webapp.settings_prod -o python_files=tests.py -o django_find_project=false
  ```
          
          
##### Further info
- The `--ds=webapp.settings_prod` arg should map to the Django settings module found in your webapp. This flag negates the need for a 'pytest.ini' configuration file which points to the settings file in your project. See: [Configuring Django settings](https://pytest-django.readthedocs.io/en/latest/configuring_django.html#command-line-option-ds-settings)

- The `-o python_files=tests.py` arg is used to override the file syntax that pytest uses when looking for you test file. Again, this argument negates the need for a 'pytest.ini' config by simply overriding the defauly file syntax. See: [changing file syntax](https://docs.pytest.org/en/6.2.x/example/pythoncollection.html#changing-naming-conventions) | [Naming conventions and test discovery](https://docs.pytest.org/en/reorganize-docs/new-docs/user/naming_conventions.html)

- The `-o django_find_project=false` arg is used to override the default pytest-django project discovery - Instead, we include the directory of the webapp as an environment variable with `env: PYTHONPATH: webapp/src/` (the directory included here should be the folder containing your 'manage.py' file).
