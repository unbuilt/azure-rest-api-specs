import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";
import "@typespec/rest";
import "@typespec/http";
import "./scenarioRun.models.tsp";
import "./lro-helpers.tsp";

using Azure.ResourceManager;
using Azure.Core;
using TypeSpec.Versioning;
using TypeSpec.Http;
using TypeSpec.Rest;

namespace Microsoft.Chaos;

@added(Microsoft.Chaos.Versions.v2026_05_01_preview)
@removed(Microsoft.Chaos.Versions.v2025_01_01)
@armResourceOperations
interface ScenarioRuns {
  /**
   * Get a scenario run.
   */
  get is ArmResourceRead<ScenarioRun>;

  /**
   * Get a list of scenario runs.
   */
  listAll is ArmResourceListByParent<
    ScenarioRun,
    Response = ScenarioRunListResult
  >;

  /**
   * Cancel the currently running scenario execution.
   */
  @added(Microsoft.Chaos.Versions.v2026_05_01_preview)
  cancel is ArmResourceActionNoContentAsyncWithLocationResult<
    ScenarioRun,
    void,
    ScenarioRun
  >;
}

@@doc(ScenarioRun.properties, "The properties of scenario run.");
