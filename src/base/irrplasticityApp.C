#include "irrplasticityApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "ModulesApp.h"
#include "MooseSyntax.h"

InputParameters
irrplasticityApp::validParams()
{
  InputParameters params = MooseApp::validParams();
  params.set<bool>("use_legacy_material_output") = false;
  params.set<bool>("use_legacy_initial_residual_evaluation_behavior") = false;
  return params;
}

irrplasticityApp::irrplasticityApp(InputParameters parameters) : MooseApp(parameters)
{
  irrplasticityApp::registerAll(_factory, _action_factory, _syntax);
}

irrplasticityApp::~irrplasticityApp() {}

void
irrplasticityApp::registerAll(Factory & f, ActionFactory & af, Syntax & syntax)
{
  ModulesApp::registerAllObjects<irrplasticityApp>(f, af, syntax);
  Registry::registerObjectsTo(f, {"irrplasticityApp"});
  Registry::registerActionsTo(af, {"irrplasticityApp"});

  /* register custom execute flags, action syntax, etc. here */
}

void
irrplasticityApp::registerApps()
{
  registerApp(irrplasticityApp);
}

/***************************************************************************************************
 *********************** Dynamic Library Entry Points - DO NOT MODIFY ******************************
 **************************************************************************************************/
extern "C" void
irrplasticityApp__registerAll(Factory & f, ActionFactory & af, Syntax & s)
{
  irrplasticityApp::registerAll(f, af, s);
}
extern "C" void
irrplasticityApp__registerApps()
{
  irrplasticityApp::registerApps();
}
