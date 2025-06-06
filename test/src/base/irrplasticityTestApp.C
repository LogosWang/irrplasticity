//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html
#include "irrplasticityTestApp.h"
#include "irrplasticityApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "MooseSyntax.h"

InputParameters
irrplasticityTestApp::validParams()
{
  InputParameters params = irrplasticityApp::validParams();
  params.set<bool>("use_legacy_material_output") = false;
  params.set<bool>("use_legacy_initial_residual_evaluation_behavior") = false;
  return params;
}

irrplasticityTestApp::irrplasticityTestApp(InputParameters parameters) : MooseApp(parameters)
{
  irrplasticityTestApp::registerAll(
      _factory, _action_factory, _syntax, getParam<bool>("allow_test_objects"));
}

irrplasticityTestApp::~irrplasticityTestApp() {}

void
irrplasticityTestApp::registerAll(Factory & f, ActionFactory & af, Syntax & s, bool use_test_objs)
{
  irrplasticityApp::registerAll(f, af, s);
  if (use_test_objs)
  {
    Registry::registerObjectsTo(f, {"irrplasticityTestApp"});
    Registry::registerActionsTo(af, {"irrplasticityTestApp"});
  }
}

void
irrplasticityTestApp::registerApps()
{
  registerApp(irrplasticityApp);
  registerApp(irrplasticityTestApp);
}

/***************************************************************************************************
 *********************** Dynamic Library Entry Points - DO NOT MODIFY ******************************
 **************************************************************************************************/
// External entry point for dynamic application loading
extern "C" void
irrplasticityTestApp__registerAll(Factory & f, ActionFactory & af, Syntax & s)
{
  irrplasticityTestApp::registerAll(f, af, s);
}
extern "C" void
irrplasticityTestApp__registerApps()
{
  irrplasticityTestApp::registerApps();
}
