section pbiAdminAPI;

// OAuth Setup
client_id = Text.FromBinary(Extension.Contents("AppID.txt"));

client_secret = Text.FromBinary(Extension.Contents("ClientSecret.txt"));

redirect_uri = "https://oauth.powerbi.com/views/oauthredirect.html";

token_uri = "https://login.windows.net/common/oauth2/token";

authorize_uri = "https://login.windows.net/common/oauth2/authorize";

logout_uri = "https://login.microsoftonline.com/logout.srf";

resource_uri = "https://analysis.windows.net/powerbi/api";

learn_more_uri = "https://github.com/tirnovar/Power-BI-Admin-REST-API-Connector";

// Static variables
api_uri = "https://api.powerbi.com/v1.0/myorg";
fabric_api_uri = "https://api.fabric.microsoft.com/v1";

// Connector Window
windowWidth = 1024;
windowHeight = 1024;

// Source
[
    DataSource.Kind = "pbiAdminAPI",
    Publish = "pbiAdminAPI.UI"
]
// SHARED Declaration
shared pbiAdminAPI.Navigation = () as table =>
    // Navigation
    //** Main Navigation
    let
        objects = #table(
            {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"},
            {
                {
                    Extension.LoadString("GroupsAdmin"),
                    "GroupsAdmin",
                    GroupsNavigation(),
                    "Folder",
                    "GroupsAdmin",
                    false
                },
                {
                    Extension.LoadString("DataflowsAdmin"),
                    "DataflowsAdmin",
                    DataflowsNavigation(),
                    "Folder",
                    "DataflowsAdmin",
                    false
                },
                {
                    Extension.LoadString("CapacitiesAdmin"),
                    "CapacitiesAdmin",
                    CapacitiesNavigation(),
                    "Folder",
                    "CapacitiesAdmin",
                    false
                },
                {
                    Extension.LoadString("DatasetsAdmin"),
                    "DatasetsAdmin",
                    DatasetsNavigation(),
                    "Folder",
                    "DatasetsAdmin",
                    false
                },
                {
                    Extension.LoadString("ReportsAdmin"),
                    "ReportsAdmin",
                    ReportsNavigation(),
                    "Folder",
                    "ReportsAdmin",
                    false
                },
                {Extension.LoadString("AppAdmin"), "AppAdmin", AppNavigation(), "Folder", "AppAdmin", false},
                {
                    Extension.LoadString("DeploymentPipelinesAdmin"),
                    "DeploymentPipelinesAdmin",
                    DeploymentPipelinesNavigation(),
                    "Folder",
                    "DeploymentPipelinesAdmin",
                    false
                },
                {
                    Extension.LoadString("DashboardsAdmin"),
                    "DashboardsAdmin",
                    DashboardNavigation(),
                    "Folder",
                    "DashboardsAdmin",
                    false
                },
                {
                    Extension.LoadString("AboutTenantAdmin"),
                    "AboutTenantAdmin",
                    AboutTenantNavigation(),
                    "Folder",
                    "AboutTenantAdmin",
                    false
                },
                {
                    Extension.LoadString("MetricsAdmin"),
                    "MetricsAdmin",
                    MetricsNavigation(),
                    "Folder",
                    "MetricsAdmin",
                    false
                },
                {
                    Extension.LoadString("GatewaysAdmin"),
                    "GatewaysAdmin",
                    GatewaysNavigation(),
                    "Folder",
                    "GatewaysAdmin",
                    false
                },
                {
                    Extension.LoadString("ScannerAdmin"),
                    "ScannerAdmin",
                    ScannerNavigation(),
                    "Folder",
                    "ScannerAdmin",
                    false
                },
                {
                    Extension.LoadString("ActivityAdmin"),
                    "ActivityAdmin",
                    ActivityNavigation(),
                    "Folder",
                    "ActivityAdmin",
                    false
                },
                {
                    Extension.LoadString("FunctionsAdmin"),
                    "FunctionsAdmin",
                    FunctionsNavigation(),
                    "Folder",
                    "FunctionsAdmin",
                    false
                }
            }
        ),
        Navigation = Table.ToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        Navigation;

//** Parcial Navigation
GroupsNavigation = () as table =>
    let
        objects = #table(
            {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"},
            {{Extension.LoadString("Groups"), "Groups & Workspaces", pbiAdminAPI.Groups(), "Table", "Table", true}}
        ),
        Navigation = Table.ToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        Navigation;

CapacitiesNavigation = () as table =>
    let
        objects = #table(
            {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"},
            {
                {Extension.LoadString("Capacities"), "Capacities", pbiAdminAPI.Capacities(), "Table", "Table", true},
                {
                    Extension.LoadString("CapacitiesUsers"),
                    "CapacitiesUsers",
                    pbiAdminAPI.CapacitiesUsers(),
                    "Table",
                    "Table",
                    true
                }
            }
        ),
        Navigation = Table.ToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        Navigation;

DatasetsNavigation = () as table =>
    let
        objects = #table(
            {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"},
            {
                {Extension.LoadString("Datasets"), "Datasets", pbiAdminAPI.Datasets(), "Table", "Table", true},
                {
                    Extension.LoadString("RefreshesOfAllDatasets"),
                    "RefreshesOfAllDatasets",
                    pbiAdminAPI.RefreshesOfAllDatasets(),
                    "Table",
                    "Table",
                    true
                },
                {
                    Extension.LoadString("RefreshesOfDataset"),
                    "RefreshesOfDataset",
                    pbiAdminAPI.RefreshesOfDataset,
                    "Function",
                    "RefreshesOfDataset",
                    true
                },
                {
                    Extension.LoadString("ParametersOfDataset"),
                    "ParametersOfDataset",
                    pbiAdminAPI.ParametersOfDataset,
                    "Function",
                    "ParametersOfDataset",
                    true
                },
                {
                    Extension.LoadString("DatasourcesOfDataset"),
                    "DatasourcesOfDataset",
                    pbiAdminAPI.DatasourcesOfDataset,
                    "Function",
                    "DatasourcesOfDataset",
                    true
                },
                {
                    Extension.LoadString("Refreshables"),
                    "Refreshables",
                    pbiAdminAPI.DatasetsRefreshables(),
                    "Table",
                    "Table",
                    true
                }
            }
        ),
        Navigation = Table.ForceToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        Navigation;

ReportsNavigation = () as table =>
    let
        objects = #table(
            {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"},
            {
                {Extension.LoadString("Reports"), "Reports", pbiAdminAPI.Reports(), "Table", "Table", true},
                {
                    Extension.LoadString("ReportsUsers"),
                    "ReportsUsers",
                    pbiAdminAPI.ReportsUsers(),
                    "Table",
                    "Table",
                    true
                },
                {
                    Extension.LoadString("ReportsSubscriptions"),
                    "ReportsSubscriptions",
                    pbiAdminAPI.ReportsSubscriptions(),
                    "Table",
                    "Table",
                    true
                }
            }
        ),
        Navigation = Table.ToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        Navigation;

AppNavigation = () as table =>
    let
        objects = #table(
            {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"},
            {
                {Extension.LoadString("Apps"), "Apps", pbiAdminAPI.Apps(), "Table", "Table", true},
                {Extension.LoadString("AppsUsers"), "AppsUsers", pbiAdminAPI.AppsUsers(), "Table", "Table", true}
            }
        ),
        Navigation = Table.ToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        Navigation;

DeploymentPipelinesNavigation = () as table =>
    let
        objects = #table(
            {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"},
            {
                {
                    Extension.LoadString("DeploymentPipelines"),
                    "DeploymentPipelines",
                    pbiAdminAPI.DeploymentPipelines(),
                    "Table",
                    "Table",
                    true
                }
            }
        ),
        Navigation = Table.ToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        Navigation;

MetricsNavigation = () as table =>
    let
        objects = #table(
            {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"},
            {
                {
                    Extension.LoadString("Scorecards"),
                    "Scorecards",
                    pbiAdminAPI.Scorecards,
                    "Function",
                    "Scorecards",
                    true
                },
                {Extension.LoadString("Goals"), "Goals", pbiAdminAPI.Goals, "Function", "Goals", true},
                {
                    Extension.LoadString("GoalValuesAndNotes"),
                    "GoalValuesAndNotes",
                    pbiAdminAPI.GoalValuesAndNotes,
                    "Function",
                    "GoalValuesAndNotes",
                    true
                }
            }
        ),
        Navigation = Table.ForceToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        Navigation;

DashboardNavigation = () as table =>
    let
        objects = #table(
            {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"},
            {
                {Extension.LoadString("Dashboards"), "Dashboards", pbiAdminAPI.Dashboards(), "Table", "Table", true},
                {
                    Extension.LoadString("DashboardsUsers"),
                    "DashboardsUsers",
                    pbiAdminAPI.DashboardsUsers(),
                    "Table",
                    "Table",
                    true
                },
                {
                    Extension.LoadString("DashboardsSubscriptions"),
                    "DashboardsSubscriptions",
                    pbiAdminAPI.DashboardsSubscriptions(),
                    "Table",
                    "Table",
                    true
                },
                {Extension.LoadString("Tiles"), "Tiles", pbiAdminAPI.Tiles(), "Table", "Table", true}
            }
        ),
        Navigation = Table.ToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        Navigation;

GatewaysNavigation = () as table =>
    let
        objects = #table(
            {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"},
            {
                {Extension.LoadString("Gateways"), "Gateways", pbiAdminAPI.Gateways(), "Table", "Table", true},
                {Extension.LoadString("MyGateways"), "MyGateways", pbiAdminAPI.MyGateways(), "Table", "Table", true},
                {
                    Extension.LoadString("GatewaysDatasources"),
                    "GatewaysDatasources",
                    pbiAdminAPI.MyGatewaysDatasources(),
                    "Table",
                    "Table",
                    true
                }
            }
        ),
        Navigation = Table.ToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        Navigation;

AboutTenantNavigation = () as table =>
    let
        objects = #table(
            {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"},
            {
                {
                    Extension.LoadString("TenantSettings"),
                    "TenantSettings",
                    pbiAdminAPI.TenantSettings(),
                    "Table",
                    "Table",
                    true
                },
                {Extension.LoadString("TenantKeys"), "TenantKeys", pbiAdminAPI.TenantKeys(), "Table", "Table", true},
                {Extension.LoadString("Imports"), "Imports", pbiAdminAPI.Imports(), "Table", "Table", true},
                {
                    Extension.LoadString("AvaiableFestures"),
                    "AvaiableFestures",
                    pbiAdminAPI.AvaiableFeatures(),
                    "Table",
                    "Table",
                    true
                },
                {Extension.LoadString("LinkShared"), "LinkShared", pbiAdminAPI.LinkShared(), "Table", "Table", true},
                {
                    Extension.LoadString("PublishedToWeb"),
                    "PublishedToWeb",
                    pbiAdminAPI.PublishedToWeb(),
                    "Table",
                    "Table",
                    true
                },
                {
                    Extension.LoadString("UnusedArtifacts"),
                    "UnusedArtifacts",
                    pbiAdminAPI.UnusedArtifacts(),
                    "Table",
                    "Table",
                    true
                },
                {
                    Extension.LoadString("Domains"),
                    "Domains",
                    pbiAdminAPI.Domains(),
                    "Table",
                    "Table",
                    true
                }
            }
        ),
        Navigation = Table.ToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        Navigation;

DataflowsNavigation = () as table =>
    let
        objects = #table(
            {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"},
            {
                {Extension.LoadString("Dataflows"), "Dataflows", pbiAdminAPI.Dataflows(), "Table", "Table", true},
                {
                    Extension.LoadString("StorageAccounts"),
                    "StorageAccounts",
                    pbiAdminAPI.StorageAccounts(),
                    "Table",
                    "Table",
                    true
                },
                {
                    Extension.LoadString("DataflowsDatasources"),
                    "DataflowsDatasources",
                    pbiAdminAPI.DataflowsDatasources(),
                    "Table",
                    "Table",
                    true
                },
                {
                    Extension.LoadString("DataflowsUsers"),
                    "DataflowsUsers",
                    pbiAdminAPI.DataflowsUsers(),
                    "Table",
                    "Table",
                    true
                }
            }
        ),
        Navigation = Table.ToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        Navigation;

FunctionsNavigation = () as table =>
    let
        objects = #table(
            {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"},
            {
                {
                    Extension.LoadString("ArtifactAccess"),
                    "ArtifactAccess",
                    pbiAdminAPI.UserArtifactAccess,
                    "Function",
                    "ArtifactAccess",
                    true
                },
                {
                    Extension.LoadString("Subscriptions"),
                    "Subscriptions",
                    pbiAdminAPI.Subscriptions,
                    "Function",
                    "Subscriptions",
                    true
                },
                {
                    Extension.LoadString("ExecuteQuery"),
                    "ExecuteQuery",
                    pbiAdminAPI.ExecuteQuery,
                    "Function",
                    "ExecuteQuery",
                    true
                },
                {
                    Extension.LoadString("OwnAPICall"),
                    "OwnAPICall",
                    pbiAdminAPI.OwnAPICall,
                    "Function",
                    "OwnAPICall",
                    true
                },
                {
                    Extension.LoadString("GroupsCaller"),
                    "GroupsCaller",
                    pbiAdminAPI.GroupsCaller,
                    "Function",
                    "GroupsCaller",
                    true
                }
            }
        ),
        Navigation = Table.ForceToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        Navigation;

ScannerNavigation = () as table =>
    let
        objects = #table(
            {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"},
            {
                {
                    Extension.LoadString("ScannerAPIInfo"),
                    "ScannerAPIInfo",
                    pbiAdminAPI.ScannerAPIInfo,
                    "Function",
                    "ScannerAPIInfo",
                    true
                },
                {
                    Extension.LoadString("ScannerAPIModifiedWorkspaces"),
                    "ScannerAPIModifiedWorkspaces",
                    pbiAdminAPI.ScannerAPIModifiedWorkspaces(),
                    "Table",
                    "Table",
                    true
                },
                {
                    Extension.LoadString("ScannerAPIStatusAndResult"),
                    "ScannerAPIStatusAndResult",
                    pbiAdminAPI.ScannerAPIStatusAndResult,
                    "Function",
                    "ScannerAPIStatusAndResult",
                    true
                }
            }
        ),
        Navigation = Table.ForceToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        Navigation;

ActivityNavigation = () as table =>
    let
        objects = #table(
            {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"},
            {
                {
                    Extension.LoadString("ActivityEventsBeforeTwoDays"),
                    "ActivityEventsBeforeTwoDays",
                    pbiAdminAPI.ActivityEventsBeforeTwoDays(),
                    "Table",
                    "Table",
                    true
                },
                {
                    Extension.LoadString("ActivityEventsLast30Days"),
                    "ActivityEventsLast30Days",
                    pbiAdminAPI.ActivityEventsLast30Days(),
                    "Table",
                    "Table",
                    true
                },
                {
                    Extension.LoadString("ExternalApplicationConnectedBy30Days"),
                    "ExternalApplicationConnectedBy30Days",
                    pbiAdminAPI.ExternalApplicationConnectedBy30Days(),
                    "Table",
                    "Table",
                    true
                },
                {
                    Extension.LoadString("ExportedReportBy30Days"),
                    "ExportedReportBy30Days",
                    pbiAdminAPI.ExportedReportBy30Days(),
                    "Table",
                    "Table",
                    true
                }
            }
        ),
        Navigation = Table.ForceToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        Navigation;

// Output generators
// ** Generic Fucntions
pbiAdminAPI = [
    TestConnection = (dataSourcePath) => {"pbiAdminAPI.Navigation"},
    Authentication = [
        Aad = [
            AuthorizationUri = authorize_uri,
            Resource = resource_uri
        ]
    ],
    Label = Extension.LoadString("DataSourceLabel")
];

// ** Groups
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.Groups = () =>
    let
        expandParameters = "users,reports,dashboards,datasets,dataflows,workbooks",
        queryRecord = [#"$top" = "5000", #"$expand" = expandParameters],
        apiCall = List.Combine(List.Generate(
            () =>
                [
                    values = Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "admin/groups",
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ],
                                Query = queryRecord
                            ]
                        )
                    )[value]?,
                    index = 5000
                ],
            each not List.IsEmpty([values]),
            each
                [
                    values = Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "admin/groups",
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ],
                                Query = Record.AddField(queryRecord, "$skip", Text.From([index]))
                            ]
                        )
                    )[value]?,
                    index = [index] + 5000
                ],
            each [values]
        )),
        output = #table(
            type table [
                id = text,
                isReadOnly = logical,
                isOnDedicatedCapacity = logical,
                capacityId = text,
                capacityMigrationStatus = text,
                #"type" = text,
                state = text,
                name = text,
                users = list,
                reports = list,
                dashboards = list,
                datasets = list,
                dataflows = list,
                workbooks = list
            ],
            List.Transform(
                apiCall,
                each
                    {
                        _[id]?,
                        Logical.From(_[isReadOnly]?),
                        Logical.From(_[isOnDedicatedCapacity]?),
                        _[capacityId]?,
                        _[capacityMigrationStatus]?,
                        _[#"type"]?,
                        _[state]?,
                        _[name]?,
                        _[users]?,
                        _[reports]?,
                        _[dashboards]?,
                        _[datasets]?,
                        _[dataflows]?,
                        _[workbooks]?
                    }
            )
        )
    in
        output;
//** Datasets
//**** Table of Datasets
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.Datasets = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                api_uri, [
                    RelativePath = "admin/datasets",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ]
                ]
            )
        ),
        output = #table(
            type table [
                id = text,
                name = text,
                addRowsAPIEnabled = logical,
                configuredBy = text,
                isRefreshable = logical,
                isEffectiveIdentityRequired = logical,
                isEffectiveIdentityRolesRequired = logical,
                isOnPremGatewayRequired = logical,
                webUrl = text,
                targetStorageMode = text,
                createdDate = datetime,
                createReportEmbedURL = text,
                qnaEmbedURL = text,
                upstreamDatasets = list
            ],
            List.Transform(
                apiCall[value],
                each
                    {
                        _[id]?,
                        _[name]?,
                        _[addRowsAPIEnabled]?,
                        _[configuredBy]?,
                        _[isRefreshable]?,
                        _[isEffectiveIdentityRequired]?,
                        _[isEffectiveIdentityRolesRequired]?,
                        _[isOnPremGatewayRequired]?,
                        _[webUrl]?,
                        _[targetStorageMode]?,
                        DateTime.From(_[createdDate]?),
                        _[createReportEmbedURL]?,
                        _[qnaEmbedURL]?,
                        _[upstreamDatasets]?
                    }
            )
        )
    in
        output;
//**** Refresh history of ALL Datasets
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.RefreshesOfAllDatasets = () =>
    let
        datasetsId = pbiAdminAPI.Datasets()[id],
        transformator = List.Transform(
            datasetsId,
            each
                try
                    Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "admin/datasets/" & _ & "/refreshes",
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ]
                            ]
                        )
                    )[value] otherwise {}
        ),
        unitor = List.RemoveNulls(List.Union(transformator)),
        output = #table(
            type table [
                requestId = text,
                id = text,
                refreshType = text,
                startTime = datetime,
                endTime = datetime,
                status = text,
                refreshInSeconds = number
            ],
            List.Transform(
                unitor,
                each
                    let
                        stTime = DateTime.From(_[startTime]?),
                        enTime = DateTime.From(_[endTime]?),
                        durationOfRefresh =
                            if stTime = null or enTime = null then
                                null
                            else
                                Duration.TotalSeconds(enTime - stTime)
                    in
                        {_[requestId]?, _[id]?, _[refreshType]?, stTime, enTime, _[status]?, durationOfRefresh}
            )
        )
    in
        output;
//**** Refresh history of Datasets
[
    DataSource.Kind = "pbiAdminAPI"
]
shared pbiAdminAPI.RefreshesOfDataset = Value.ReplaceType(RefreshesOfDataset, RefreshesOfDatasetType);

RefreshesOfDatasetType = type function (
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataset ID",
            Documentation.FieldDescription = "Dataset ID that will be scanned for its refresh history",
            Documentation.SampleValues = {"xxx-xxxx-yyxa..."}
        ]
    )
) as table meta [
    Documentation.Name = "pbiAdminAPI.RefreshesOfDataset",
    Documentation.LongDescription = "Returns refresh history of selected Dataset and calculates refresh time.",
    Documentation.Examples = {[
        Code = "=pbiAdminAPI.RefreshesOfDataset(""xxx-xxxx-yyxa..."")",
        Result = ""
    ]}
];

RefreshesOfDataset = (optional datasetId as text) =>
    let
        functionVarTester =
            if (datasetId <> null and datasetId <> "") then
                let
                    apiCall = Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "admin/datasets/" & datasetId & "/refreshes",
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ]
                            ]
                        )
                    )[value],
                    output = #table(
                        type table [
                            requestId = text,
                            id = text,
                            refreshType = text,
                            startTime = datetime,
                            endTime = datetime,
                            status = text,
                            refreshInSeconds = number
                        ],
                        List.Transform(
                            apiCall,
                            each
                                let
                                    stTime = DateTime.From(_[startTime]?),
                                    enTime = DateTime.From(_[endTime]?),
                                    durationOfRefresh =
                                        if stTime = null or enTime = null then
                                            null
                                        else
                                            Duration.TotalSeconds(enTime - stTime)
                                in
                                    {
                                        _[requestId]?,
                                        _[id]?,
                                        _[refreshType]?,
                                        stTime,
                                        enTime,
                                        _[status]?,
                                        durationOfRefresh
                                    }
                        )
                    )
                in
                    output
            else
                #table(type table [Response = text], {{"Please fill parameter of function."}})
    in
        functionVarTester;

//**** Parameters of Datasets
[
    DataSource.Kind = "pbiAdminAPI"
]
shared pbiAdminAPI.ParametersOfDataset = Value.ReplaceType(ParametersOfDataset, ParametersOfDatasetType);

ParametersOfDatasetType = type function (
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataset ID",
            Documentation.FieldDescription = "Dataset ID for what will be returned its Parameters",
            Documentation.SampleValues = {"xxx-xxxx-yyxa..."}
        ]
    )
) as table meta [
    Documentation.Name = "pbiAdminAPI.ParametersOfDataset",
    Documentation.LongDescription = "Returns all parameters that are used in dataset. 
        !!! THIS FUNCTION IS NOT WORKING WITH DATASET CONNECTED TO SQL, ORACLE, TERADATA, AND SAP HANA IN DIRECTQUERY MODE !!!",
    Documentation.Examples = {[
        Code = "=pbiAdminAPI.ParametersOfDataset(""xxx-xxxx-yyxa..."")",
        Result = ""
    ]}
];

ParametersOfDataset = (optional datasetId as text) =>
    let
        functionVarTester =
            if (datasetId <> null and datasetId <> "") then
                let
                    apiCall = Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "admin/datasets/" & datasetId & "/parameters",
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ]
                            ]
                        )
                    )[value],
                    output = #table(
                        type table [name = text, #"type" = text, isRequired = logical, currentValue = text],
                        List.Transform(apiCall, each {_[name]?, _[#"type"]?, _[isRequired]?, _[currentValue]?})
                    )
                in
                    output
            else
                #table(type table [Response = text], {{"Please fill parameter of function."}})
    in
        functionVarTester;

//**** Datasources of Datasets
[
    DataSource.Kind = "pbiAdminAPI"
]
shared pbiAdminAPI.DatasourcesOfDataset = Value.ReplaceType(DatasourcesOfDataset, DatasourcesOfDatasetType);

DatasourcesOfDatasetType = type function (
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataset ID",
            Documentation.FieldDescription = "Dataset ID for what will be returned its Parameters",
            Documentation.SampleValues = {"xxx-xxxx-yyxa..."}
        ]
    )
) as table meta [
    Documentation.Name = "pbiAdminAPI.DatasourcesOfDataset",
    Documentation.LongDescription = "Returns datasources that are used in dataset. 
        !!! THIS FUNCTION IS NOT WORKING WITH DATASET CONNECTED TO SQL, ORACLE, TERADATA, AND SAP HANA IN DIRECTQUERY MODE !!!",
    Documentation.Examples = {[
        Code = "=pbiAdminAPI.DatasourcesOfDataset(""xxx-xxxx-yyxa..."")",
        Result = ""
    ]}
];

DatasourcesOfDataset = (optional datasetId as text) =>
    let
        functionVarTester =
            if (datasetId <> null and datasetId <> "") then
                let
                    apiCall = Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "admin/datasets/" & datasetId & "/datasources",
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ]
                            ]
                        )
                    )[value],
                    output = #table(
                        type table [
                            datasourceType = text,
                            datasourceId = text,
                            connectionDetails_account = text,
                            connectionDetails_domain = text,
                            connectionDetails_path = text,
                            connectionDetails_kind = text,
                            connectionDetails_url = text,
                            connectionDetails_connectionString = text,
                            connectionDetails_extensionDataSourceKind = text,
                            connectionDetails_extensionDataSourcePath = text,
                            gatewayId = text
                        ],
                        List.Transform(
                            apiCall,
                            each
                                {
                                    _[datasourceType]?,
                                    _[datasourceId]?,
                                    _[connectionDetails]?[account]?,
                                    _[connectionDetails]?[domain]?,
                                    _[connectionDetails]?[path]?,
                                    _[connectionDetails]?[kind]?,
                                    _[connectionDetails]?[url]?,
                                    _[connectionDetails]?[connectionString]?,
                                    _[connectionDetails]?[extensionDataSourceKind]?,
                                    _[connectionDetails]?[extensionDataSourcePath]?,
                                    _[gatewayId]?
                                }
                        )
                    )
                in
                    output
            else
                #table(type table [Response = text], {{"Please fill parameter of function."}})
    in
        functionVarTester;

//**** Table of Refreshable datasets
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.DatasetsRefreshables = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                api_uri,
                [
                    RelativePath = "admin/capacities/refreshables",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ],
                    Query = [
                        #"$expand" = "capacity,group"
                    ]
                ]
            )
        ),
        output = #table(
            type table [
                id = text,
                name = text,
                kind = text,
                startTime = datetime,
                endTime = datetime,
                refreshCount = number,
                refreshFailures = number,
                averageDuration = number,
                medianDuration = number,
                refreshesPerDay = number,
                lastRefresh = record,
                refreshSchedule.days = list,
                refreshSchedule.times = list,
                refreshSchedule.enabled = logical,
                refreshSchedule.localTimeZoneId = text,
                refreshSchedule.notifyOption = text,
                configuredBy = text,
                capacity = record,
                group = record
            ],
            List.Transform(
                apiCall[value],
                each
                    {
                        _[id]?,
                        _[name]?,
                        _[kind]?,
                        DateTime.From(_[startTime]?),
                        DateTime.From(_[endTime]?),
                        _[refreshCount]?,
                        _[refreshFailures]?,
                        _[averageDuration]?,
                        _[medianDuration]?,
                        _[refreshesPerDay]?,
                        _[lastRefresh]?,
                        _[refreshSchedule]?[days]?,
                        _[refreshSchedule]?[times]?,
                        _[refreshSchedule]?[enabled]?,
                        _[refreshSchedule]?[localTImeZoneId]?,
                        _[refreshSchedule]?[notifyOption]?,
                        _[configuredBy]?{0} ?,
                        _[capacity]?,
                        _[group]?
                    }
            )
        )
    in
        output;
//** Reports
//**** Table of Reports
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.Reports = () =>
    let
        apiCall = Json.Document(
            Web.Contents(api_uri, [
                RelativePath = "admin/reports",
                Headers = [
                    #"Content-Type" = "application/json"
                ]
            ])
        ),
        output = #table(
            type table [
                id = text,
                reportType = text,
                name = text,
                webUrl = text,
                embedUrl = text,
                datasetId = text,
                createdDateTime = datetime,
                modifiedDateTime = datetime,
                createdBy = text,
                modifiedBy = text
            ],
            List.Transform(
                apiCall[value],
                each
                    {
                        _[id]?,
                        _[reportType]?,
                        _[name]?,
                        _[webUrl]?,
                        _[embedUrl]?,
                        _[datasetId]?,
                        DateTime.From(_[createdDateTime]?),
                        DateTime.From(_[modifiedDateTime]?),
                        _[createdBy]?,
                        _[modifiedBy]?
                    }
            )
        )
    in
        output;
//**** Users of Reports
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.ReportsUsers = () =>
    let
        reports = pbiAdminAPI.Reports()[[id]],
        addon = Table.AddColumn(
            reports,
            "Users",
            each
                Json.Document(
                    Web.Contents(
                        api_uri,
                        [
                            RelativePath = "admin/reports/" & [id] & "/users",
                            Headers = [
                                #"Content-Type" = "application/json"
                            ]
                        ]
                    )
                )[value]?,
            type list
        ),
        expander = Table.ExpandTableColumn(
            addon,
            "Users",
            {"displayName", "emailAddress", "dashboardUserAccessRight", "identifier", "graphId", "principalType"},
            {"displayName", "emailAddress", "dashboardUserAccessRight", "identifier", "graphId", "principalType"}
        ),
        output = Table.TransformColumnTypes(
            expander,
            {
                {"displayName", type text},
                {"emailAddress", type text},
                {"dashboardUserAccessRight", type text},
                {"identifier", type text},
                {"graphId", type text},
                {"principalType", type text}
            }
        )
    in
        output;
//**** Subscriptions of Reports
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.ReportsSubscriptions = () =>
    let
        reports = pbiAdminAPI.Reports()[[id]],
        addon = Table.AddColumn(
            reports,
            "Subscriptions",
            each
                Json.Document(
                    Web.Contents(
                        api_uri,
                        [
                            RelativePath = "admin/reports/" & [id] & "/subscriptions",
                            Headers = [
                                #"Content-Type" = "application/json"
                            ]
                        ]
                    )
                )[value]?,
            type list
        ),
        expander = Table.ExpandTableColumn(
            addon,
            "Subscriptions",
            {
                "id",
                "title",
                "artifactId",
                "artifactDisplayName",
                "subArtifactDisplayName",
                "isEnabled",
                "frequency",
                "startDate",
                "endDate",
                "linkToContent",
                "previewImage",
                "attachmentFormat",
                "users"
            },
            {
                "subscriptionId",
                "title",
                "artifactId",
                "artifactDisplayName",
                "subArtifactDisplayName",
                "isEnabled",
                "frequency",
                "startDate",
                "endDate",
                "linkToContent",
                "previewImage",
                "attachmentFormat",
                "users"
            }
        ),
        output = Table.TransformColumnTypes(
            expander,
            {
                {"subscriptionId", type text},
                {"title", type text},
                {"artifactId", type text},
                {"artifactDisplayName", type text},
                {"subArtifactDisplayName", type text},
                {"isEnabled", type logical},
                {"frequency", type text},
                {"startDate", type text},
                {"endDate", type text},
                {"linkToContent", type logical},
                {"previewImage", type logical},
                {"attachmentFormat", type text}
            }
        )
    in
        Table.SelectRows(output, each [subscriptionId] <> null);
//** Apps
//**** Talbe of Apps
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.Apps = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                api_uri,
                [
                    RelativePath = "admin/apps",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ],
                    Query = [
                        #"$top" = "100"
                    ]
                ]
            )
        ),
        output = #table(
            type table [
                id = text, name = text, lastUpdate = datetime, description = text, publishedBy = text, workspaceId = text
            ],
            List.Transform(
                apiCall[value],
                each
                    {
                        _[id]?,
                        _[name]?,
                        DateTime.From(_[lastUpdate]?),
                        _[description]?,
                        _[publishedBy]?,
                        _[workspaceId]?
                    }
            )
        )
    in
        output;
//**** Apps Users
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.AppsUsers = () =>
    let
        apps = pbiAdminAPI.Apps()[[id]],
        addon = Table.AddColumn(
            apps,
            "Users",
            each
                Json.Document(
                    Web.Contents(
                        api_uri,
                        [
                            RelativePath = "admin/apps/" & [id] & "/users",
                            Headers = [
                                #"Content-Type" = "application/json"
                            ]
                        ]
                    )
                )[value]?,
            type list
        ),
        expander = Table.ExpandTableColumn(
            addon,
            "Users",
            {"displayName", "emailAddress", "appUserAccessRight", "identifier", "graphId", "principalType"},
            {"displayName", "emailAddress", "appUserAccessRight", "identifier", "graphId", "principalType"}
        ),
        output = Table.TransformColumnTypes(
            expander,
            {
                {"displayName", type text},
                {"emailAddress", type text},
                {"appUserAccessRight", type text},
                {"identifier", type text},
                {"graphId", type text},
                {"principalType", type text}
            }
        )
    in
        output;
//** Deployment Pipelines
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.DeploymentPipelines = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                api_uri,
                [
                    RelativePath = "admin/pipelines",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ],
                    Query = [
                        #"$expand" = "stages,users"
                    ]
                ]
            )
        ),
        output = #table(
            type table [id = text, displayName = text, stages = table, users = table],
            List.Transform(
                apiCall[value],
                each
                    {
                        _[id]?,
                        _[displayName]?,
                        Table.AddColumn(
                            Table.FromRecords(
                                _[stages]?, type table [order, workspaceId, workspaceName], MissingField.UseNull
                            ),
                            "Type",
                            each if [order] = "0" then "Development" else if [order] = "1" then "Test" else "Production"
                        ),
                        Table.FromRecords(
                            _[users]?, type table [accessRight, identifier, principalType], MissingField.UseNull
                        )
                    }
            )
        )
    in
        output;
//** Dashboards
//**** Dashboard
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.Dashboards = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                api_uri, [
                    RelativePath = "admin/dashboards",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ]
                ]
            )
        ),
        output = #table(
            type table [
                id = text, displayName = text, isReadOnly = logical, webUrl = text, embedUrl = text, subscriptions = list
            ],
            List.Transform(
                apiCall[value],
                each
                    {
                        _[id]?,
                        _[displayName]?,
                        Logical.From(_[isReadOnly]?),
                        _[webUrl]?,
                        _[embedUrl]?,
                        _[subscriptions]?
                    }
            )
        )
    in
        output;
//**** Users of Dashboards
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.DashboardsUsers = () =>
    let
        dashboards = pbiAdminAPI.Dashboards()[[id]],
        addon = Table.AddColumn(
            dashboards,
            "Users",
            each
                Json.Document(
                    Web.Contents(
                        api_uri,
                        [
                            RelativePath = "admin/dashboards/" & [id] & "/users",
                            Headers = [
                                #"Content-Type" = "application/json"
                            ]
                        ]
                    )
                )[value]?,
            type list
        ),
        expander = Table.ExpandTableColumn(
            addon,
            "Users",
            {"displayName", "emailAddress", "dashboardUserAccessRight", "identifier", "graphId", "principalType"},
            {"displayName", "emailAddress", "dashboardUserAccessRight", "identifier", "graphId", "principalType"}
        ),
        output = Table.TransformColumnTypes(
            expander,
            {
                {"displayName", type text},
                {"emailAddress", type text},
                {"dashboardUserAccessRight", type text},
                {"identifier", type text},
                {"graphId", type text},
                {"principalType", type text}
            }
        )
    in
        output;
//**** Subscriptions of Dashboards
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.DashboardsSubscriptions = () =>
    let
        dashboards = pbiAdminAPI.Dashboards()[[id]],
        addon = Table.AddColumn(
            dashboards,
            "Subscriptions",
            each
                Json.Document(
                    Web.Contents(
                        api_uri,
                        [
                            RelativePath = "admin/dashboards/" & [id] & "/subscriptions",
                            Headers = [
                                #"Content-Type" = "application/json"
                            ]
                        ]
                    )
                )[value]?,
            type list
        ),
        expander = Table.ExpandTableColumn(
            addon,
            "Subscriptions",
            {
                "id",
                "title",
                "artifactId",
                "artifactDisplayName",
                "artifactType",
                "isEnabled",
                "frequency",
                "startDate",
                "endDate",
                "linkToContent",
                "previewImage",
                "users"
            },
            {
                "subscriptionId",
                "title",
                "artifactId",
                "artifactDisplayName",
                "artifactType",
                "isEnabled",
                "frequency",
                "startDate",
                "endDate",
                "linkToContent",
                "previewImage",
                "users"
            }
        ),
        output = Table.TransformColumnTypes(
            expander,
            {
                {"subscriptionId", type text},
                {"title", type text},
                {"artifactId", type text},
                {"artifactDisplayName", type text},
                {"artifactType", type text},
                {"isEnabled", type logical},
                {"frequency", type text},
                {"startDate", type text},
                {"endDate", type text},
                {"linkToContent", type logical},
                {"previewImage", type logical}
            }
        )
    in
        Table.SelectRows(output, each [subscriptionId] <> null);
//**** Tiles
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.Tiles = () =>
    let
        dashboards = pbiAdminAPI.Dashboards()[id],
        transformator = List.Transform(
            dashboards,
            each
                Json.Document(
                    Web.Contents(
                        api_uri,
                        [
                            RelativePath = "admin/dashboards/" & _ & "/tiles",
                            Headers = [
                                #"Content-Type" = "application/json"
                            ]
                        ]
                    )
                )[value]
        ),
        unitor = List.RemoveNulls(List.Union(transformator)),
        output = #table(
            type table [id = text, embedUrl = text, rowSpan = number, colSpan = number, reportId = text, datasetId = text],
            List.Transform(
                unitor,
                each
                    {
                        _[id]?,
                        _[embedUrl]?,
                        Number.From(_[rowSpan]?),
                        Number.From(_[colSpan]?),
                        _[reportId]?,
                        _[datasetId]?
                    }
            )
        )
    in
        output;
//** Dataflows
//**** Table of Dataflows
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.Dataflows = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                api_uri, [
                    RelativePath = "admin/dataflows",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ]
                ]
            )
        ),
        output = #table(
            type table [
                objectId = text,
                name = text,
                description = text,
                workspaceId = text,
                modelUrl = text,
                configuredBy = text,
                users = list,
                modifiedBy = text,
                modifiedDateTime = datetime
            ],
            List.Transform(
                apiCall[value],
                each
                    {
                        _[objectId]?,
                        _[name]?,
                        _[description]?,
                        _[workspaceId]?,
                        _[modelUrl]?,
                        _[configuredBy]?,
                        _[users]?,
                        _[modifiedBy]?,
                        DateTime.From(_[modifiedDateTime]?)
                    }
            )
        )
    in
        output;
//**** Dataflows Datasources
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.DataflowsDatasources = () =>
    let
        dataflows = pbiAdminAPI.Dataflows()[[objectId]],
        addon = Table.AddColumn(
            dataflows,
            "Datasources",
            each
                Json.Document(
                    Web.Contents(
                        api_uri,
                        [
                            RelativePath = "admin/dataflows/" & [objectId] & "/datasources",
                            Headers = [
                                #"Content-Type" = "application/json"
                            ]
                        ]
                    )
                )[value]?,
            type list
        ),
        expander = Table.ExpandTableColumn(
            addon,
            "Datasources",
            {"datasourceType", "datasourceId", "gatewayId", "connectionDetails"},
            {"datasourceType", "datasourceId", "gatewayId", "connectionDetails"}
        ),
        output = Table.TransformColumnTypes(
            expander, {{"datasourceType", type text}, {"datasourceId", type text}, {"gatewayId", type text}}
        )
    in
        output;
//**** Dataflows Storage Accounts
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.StorageAccounts = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                api_uri, [
                    RelativePath = "dataflowStorageAccounts",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ]
                ]
            )
        ),
        output = #table(
            type table [id = text, name = text, isEnabled = text],
            List.Transform(apiCall[value], each {_[id]?, _[name]?, _[isEnabled]?})
        )
    in
        output;
//**** Users of Dataflows
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.DataflowsUsers = () =>
    let
        dataflows = pbiAdminAPI.Dataflows()[[objectId]],
        addon = Table.AddColumn(
            dataflows,
            "Users",
            each
                Json.Document(
                    Web.Contents(
                        api_uri,
                        [
                            RelativePath = "admin/dataflows/" & [objectId] & "/users",
                            Headers = [
                                #"Content-Type" = "application/json"
                            ]
                        ]
                    )
                )[value]?,
            type list
        ),
        expander = Table.ExpandTableColumn(
            addon,
            "Users",
            {"displayName", "emailAddress", "dataflowUserAccessRight", "identifier", "graphId", "principalType"},
            {"displayName", "emailAddress", "dataflowUserAccessRight", "identifier", "graphId", "principalType"}
        ),
        output = Table.TransformColumnTypes(
            expander,
            {
                {"displayName", type text},
                {"emailAddress", type text},
                {"dataflowUserAccessRight", type text},
                {"identifier", type text},
                {"graphId", type text},
                {"principalType", type text}
            }
        )
    in
        output;
//** Gateways
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.Gateways = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                "https://api.powerbi.com/v2.0/myorg",
                [
                    RelativePath = "gatewayclusters?$expand=permissions,memberGateways&$skip=0",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ]
                ]
            )
        ),
        output = #table(
            type table [
                id = text,
                name = text,
                #"type" = text,
                loadBalancingSettings = text,
                options = record,
                staticCapabilities = number,
                permissions = list,
                memberGateways = list,
                datasources = list,
                maxPermission = record
            ],
            List.Transform(
                apiCall[value],
                each
                    {
                        _[id]?,
                        _[name]?,
                        _[#"type"]?,
                        _[loadBalancingSettings]?,
                        _[options]?,
                        Number.From(_[staticCapabilities]?),
                        _[permissions]?,
                        _[memberGateways]?,
                        _[datasources]?,
                        _[maxPermission]?
                    }
            )
        )
    in
        output;
//** Gateways under my Administration
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.MyGateways = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                "https://api.powerbi.com/v1.0/myorg",
                [
                    RelativePath = "gateways",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ]
                ]
            )
        ),
        output = #table(
            type table [
                id = text,
                gatewayId = text,
                name = text,
                #"type" = text,
                publicKeyExponent = text,
                publicKeyModulus = text,
                gatewayAnnotation = record
            ],
            List.Transform(
                apiCall[value],
                each
                    {
                        _[id]?,
                        Text.From(_[gatewayId]?),
                        _[name]?,
                        _[#"type"]?,
                        _[publicKeyExponent]?,
                        _[publicKeyModulus]?,
                        Json.Document(_[gatewayAnnotation]?)
                    }
            )
        )
    in
        output;
//**** Datasources of MyGateways
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.MyGatewaysDatasources = () =>
    let
        gateways = pbiAdminAPI.MyGateways()[[id]],
        addon = Table.AddColumn(
            gateways,
            "DataSources",
            each
                try
                    Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "gateways/" & [id] & "/datasources",
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ]
                            ]
                        )
                    )[value]? otherwise {[
                        Response = "You are not Admin of this Gateway."
                    ]},
            type list
        ),
        expander = Table.ExpandTableColumn(
            addon,
            "DataSources",
            {"id", "datasourceType", "connectionDetails", "credentialType", "datasourceName", "Response"},
            {"datasourceId", "datasourceType", "connectionDetails", "credentialType", "datasourceName", "Response"}
        ),
        output = Table.TransformColumnTypes(
            expander,
            {
                {"datasourceId", type text},
                {"datasourceType", type text},
                {"connectionDetails", type text},
                {"credentialType", type text},
                {"datasourceName", type text},
                {"Response", type text}
            }
        )
    in
        output;
//** About Tenant
//**** Capacities
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.Capacities = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                api_uri, [
                    RelativePath = "admin/capacities",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ]
                ]
            )
        ),
        output = #table(
            type table [
                id = text,
                displayName = text,
                admins = list,
                sku = text,
                state = text,
                region = text,
                capacityUserAccessRight = text,
                tenantKeyId = text
            ],
            List.Transform(
                apiCall[value],
                each
                    {
                        _[id]?,
                        _[displayName]?,
                        _[admins]?,
                        _[sku]?,
                        _[state]?,
                        _[region]?,
                        _[capacityUserAccessRight]?,
                        _[tenantKeyId]?
                    }
            )
        )
    in
        output;
//**** Users of Capacities
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.CapacitiesUsers = () =>
    let
        capacities = pbiAdminAPI.Capacities()[[id]],
        addon = Table.AddColumn(
            capacities,
            "Users",
            each
                Json.Document(
                    Web.Contents(
                        api_uri,
                        [
                            RelativePath = "admin/capacities/" & [id] & "/users",
                            Headers = [
                                #"Content-Type" = "application/json"
                            ]
                        ]
                    )
                )[value]?,
            type list
        ),
        expander = Table.ExpandTableColumn(
            addon,
            "Users",
            {"displayName", "emailAddress", "capacityUserAccessRight", "identifier", "graphId", "principalType"},
            {"displayName", "emailAddress", "capacityUserAccessRight", "identifier", "graphId", "principalType"}
        ),
        output = Table.TransformColumnTypes(
            expander,
            {
                {"displayName", type text},
                {"emailAddress", type text},
                {"capacityUserAccessRight", type text},
                {"identifier", type text},
                {"graphId", type text},
                {"principalType", type text}
            }
        )
    in
        output;
//**** Tenant settings
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.TenantSettings = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                fabric_api_uri,
                [
                    RelativePath = "admin/tenantsettings",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ]
                ]
            )
        ),
        output = #table(
            type table [
                settingName = text,
                title = text,
                enabled = logical,
                canSpecifySecurityGroups = logical,
                enabledSecurityGroups = list,
                excludedSecurityGroups = list,
                tenantSettingGroup = text,
                properties = list
            ],
            List.Transform(
                apiCall[tenantSettings],
                each
                    {
                        _[settingName]?,
                        _[title]?,
                        Logical.From(_[enabled]?),
                        Logical.From(_[canSpecifySecurityGroups]?),
                        _[enabledSecurityGroups]?,
                        _[excludedSecurityGroups]?,
                        _[tenantSettingGroup]?,
                        _[properties]?
                    }
            )
        )
    in
        output;
//**** Domains 
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.Domains = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                fabric_api_uri,
                [
                    RelativePath = "admin/domains",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ]
                ]
            )
        ),
        output = #table(
            type table [
                id = text,
                displayName = text,
                description = text,
                parentDomainId = text,
                contributionsScope = text
            ],
            List.Transform(
                apiCall[domains],
                each
                    {
                        _[id]?,
                        _[displayName]?,
                        _[description]?,
                        _[parentDomainId]?,
                        _[contributionsScope]?
                    }
            )
        )
    in
        output;
//**** Encryption Keys
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.TenantKeys = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                api_uri, [
                    RelativePath = "admin/tenantKeys",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ]
                ]
            )
        ),
        output = #table(
            type table [
                id = text,
                name = text,
                keyVaultKeyIdentifier = text,
                isDefault = logical,
                createdAt = datetimezone,
                updatedAt = datetimezone
            ],
            List.Transform(
                apiCall[value],
                each
                    {
                        _[id]?,
                        _[name]?,
                        _[keyVaultKeyIdentifier]?,
                        _[isDefault]?,
                        DateTimeZone.From(_[createdAt]?),
                        DateTimeZone.From(_[updatedAt]?)
                    }
            )
        )
    in
        output;
//**** Imports
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.Imports = () =>
    let
        apiCall = Json.Document(
            Web.Contents(api_uri, [
                RelativePath = "admin/imports",
                Headers = [
                    #"Content-Type" = "application/json"
                ]
            ])
        ),
        output = #table(
            type table [
                id = text,
                importState = text,
                createdDateTime = datetime,
                updatedDateTime = datetime,
                name = text,
                connectionType = text,
                source = text,
                datasets = list,
                reports = list,
                dataflows = list
            ],
            List.Transform(
                apiCall[value],
                each
                    {
                        _[id]?,
                        _[importState]?,
                        DateTime.From(_[createdDateTime]?),
                        DateTime.From(_[updatedDateTime]?),
                        _[name]?,
                        _[connectionType]?,
                        _[source]?,
                        _[datasets]?,
                        _[reports]?,
                        _[dataflows]?
                    }
            )
        )
    in
        output;
//**** Avaiable Features
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.AvaiableFeatures = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                api_uri, [
                    RelativePath = "availableFeatures",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ]
                ]
            )
        ),
        output = #table(
            type table [name = text, state = text, extendedState = text, additionalInfo = record],
            List.Transform(apiCall[features], each {_[name]?, _[state]?, _[extendedState]?, _[additionalInfo]?})
        )
    in
        output;
//**** Links Shared to Whole Organization
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.LinkShared = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                api_uri,
                [
                    RelativePath = "admin/widelySharedArtifacts/linksSharedToWholeOrganization",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ]
                ]
            )
        ),
        generator = List.Buffer(
            List.Generate(
                () => [
                    result = apiCall,
                    uri = result[ArtifactAccessEntities]?
                ],
                each [uri] <> null,
                each
                    [
                        result = Json.Document(Web.Contents(uri, [
                            Headers = [
                                #"Content-Type" = "application/json"
                            ]
                        ])),
                        uri = _[result][continuationUri]?
                    ],
                each[result][ArtifactAccessEntities]?
            )
        ),
        unitor = List.Union(generator),
        output = #table(
            type table [
                artifactId = text,
                displayName = text,
                artifactType = text,
                accessRight = text,
                shareType = text,
                sharer.emailAddress = text,
                sharer.displayName = text,
                sharer.identifier = text,
                sharer.graphId = text,
                sharer.principalType = text
            ],
            List.Transform(
                List.RemoveNulls(unitor),
                each
                    {
                        _[artifactId]?,
                        _[displayName]?,
                        _[artifactType]?,
                        _[accessRight]?,
                        _[shareType]?,
                        _[sharer]?[emailAddress]?,
                        _[sharer]?[displayName]?,
                        _[sharer]?[identifier]?,
                        _[sharer]?[graphId]?,
                        _[sharer]?[principalType]?
                    }
            )
        )
    in
        output;
//**** Unused Artifacts
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.UnusedArtifacts = () =>
    let
        groups = pbiAdminAPI.Groups(),
        selector = Table.SelectRows(groups, each ([type] = "Workspace") and ([state] = "Active"))[id],
        transformator = List.Transform(
            selector,
            each
                let
                    workspaceId = _,
                    interApiCall = Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "admin/groups/" & workspaceId & "/unused",
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ]
                            ]
                        )
                    ),
                    interGenerator = List.Buffer(
                        List.Generate(
                            () => [
                                result = interApiCall,
                                uri = result[continuationUri]?
                            ],
                            each [uri] <> null,
                            each
                                [
                                    result = Json.Document(
                                        Web.Contents(uri, [
                                            Headers = [
                                                #"Content-Type" = "application/json"
                                            ]
                                        ])
                                    ),
                                    uri = _[result][continuationUri]?
                                ],
                            each[result][unusedArtifactEntities]?
                        )
                    )
                in
                    interGenerator
        ),
        unitor = List.Union(List.RemoveNulls(List.Union(transformator))),
        output = #table(
            type table [
                artifactId = text,
                displayName = text,
                artifactType = text,
                artifactSizeInMB = number,
                createdDateTime = datetime,
                lastAccessedDateTime = datetime
            ],
            List.Transform(
                unitor,
                each
                    {
                        _[artifactId]?,
                        _[displayName]?,
                        _[artifactType]?,
                        _[artifactSizeInMB]?,
                        DateTime.From(_[createdDateTime]?),
                        DateTime.From(_[lastAccessedDateTime]?)
                    }
            )
        )
    in
        output;
//**** Reports Published to Web
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.PublishedToWeb = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                api_uri,
                [
                    RelativePath = "admin/widelySharedArtifacts/publishedToWeb",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ]
                ]
            )
        ),
        generator = List.Buffer(
            List.Generate(
                () => [
                    result = apiCall,
                    uri = result[ArtifactAccessEntities]?
                ],
                each [uri] <> null,
                each
                    [
                        result = Json.Document(Web.Contents(uri, [
                            Headers = [
                                #"Content-Type" = "application/json"
                            ]
                        ])),
                        uri = _[result][continuationUri]?
                    ],
                each[result][ArtifactAccessEntities]?
            )
        ),
        unitor = List.Union(generator),
        output = #table(
            type table [
                artifactId = text,
                displayName = text,
                artifactType = text,
                accessRight = text,
                shareType = text,
                sharer.emailAddress = text,
                sharer.displayName = text,
                sharer.identifier = text,
                sharer.graphId = text,
                sharer.principalType = text
            ],
            List.Transform(
                List.RemoveNulls(unitor),
                each
                    {
                        _[artifactId]?,
                        _[displayName]?,
                        _[artifactType]?,
                        _[accessRight]?,
                        _[shareType]?,
                        _[sharer]?[emailAddress]?,
                        _[sharer]?[displayName]?,
                        _[sharer]?[identifier]?,
                        _[sharer]?[graphId]?,
                        _[sharer]?[principalType]?
                    }
            )
        )
    in
        output;
// Activity Events
//**** Activity Events Before Two Days
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.ActivityEventsBeforeTwoDays = () =>
    let
        today = Date.From(DateTime.LocalNow()),
        dateMovement = Date.AddDays(today, -2),
        startDateTimeVariable = "'" & Date.ToText(dateMovement, "yyyy-MM-ddT00:00:00.000Z") & "'",
        endDateTimeVariable = "'" & Date.ToText(dateMovement, "yyyy-MM-ddT23:59:59.999Z") & "'",
        apiCall = Json.Document(
            Web.Contents(
                api_uri,
                [
                    RelativePath = "admin/activityevents",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ],
                    Query = [
                        startDateTime = startDateTimeVariable,
                        endDateTime = endDateTimeVariable
                    ]
                ]
            )
        ),
        generator = List.Buffer(
            List.Generate(
                () => [
                    result = apiCall,
                    uri = result[continuationUri]?,
                    lastResultSet = result[lastResultSet]?
                ],
                each [uri] <> null,
                each
                    [
                        result = Json.Document(Web.Contents(uri, [
                            Headers = [
                                #"Content-Type" = "application/json"
                            ]
                        ])),
                        uri = _[result][continuationUri]?,
                        lastResultSet = _[result][lastResultSet]?
                    ],
                each[result][activityEventEntities]?
            )
        ),
        convertor = List.RemoveNulls(List.Combine(generator))
    in
        #table(type table [content = record], List.Transform(convertor, each {_}));
//**** Activity Events in Last 30 Days
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.ActivityEventsLast30Days = () =>
    let
        today = Date.From(DateTime.LocalNow()),
        startDate = Date.AddDays(today, -30),
        listofDates = List.Dates(startDate, Number.From(Date.AddDays(today, -1) - startDate), #duration(1, 0, 0, 0)),
        transformator = List.Transform(
            listofDates,
            each
                let
                    startDateTimeVariable = "'" & Date.ToText(_, "yyyy-MM-ddT00:00:00.000Z") & "'",
                    endDateTimeVariable = "'" & Date.ToText(_, "yyyy-MM-ddT23:59:59.999Z") & "'",
                    apiCall = Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "admin/activityevents",
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ],
                                Query = [
                                    startDateTime = startDateTimeVariable,
                                    endDateTime = endDateTimeVariable
                                ]
                            ]
                        )
                    ),
                    generator = List.Buffer(
                        List.Generate(
                            () =>
                                [
                                    result = apiCall,
                                    uri = result[continuationUri]?,
                                    lastResultSet = result[lastResultSet]?
                                ],
                            each [uri] <> null,
                            each
                                [
                                    result = Json.Document(
                                        Web.Contents(uri, [
                                            Headers = [
                                                #"Content-Type" = "application/json"
                                            ]
                                        ])
                                    ),
                                    uri = _[result][continuationUri]?,
                                    lastResultSet = _[result][lastResultSet]?
                                ],
                            each[result][activityEventEntities]?
                        )
                    ),
                    convertor = List.RemoveNulls(List.Combine(generator))
                in
                    convertor
        ),
        listOutputConvertor = List.RemoveNulls(List.Combine(transformator))
    in
        #table(type table [content = record], List.Transform(listOutputConvertor, each {_}));

//**** External Application Connected By 30 Days
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.ExternalApplicationConnectedBy30Days = () =>
    let
        today = Date.From(DateTime.LocalNow()),
        startDate = Date.AddDays(today, -30),
        listofDates = List.Dates(startDate, Number.From(Date.AddDays(today, -1) - startDate), #duration(1, 0, 0, 0)),
        transformator = List.Transform(
            listofDates,
            each
                let
                    startDateTimeVariable = "'" & Date.ToText(_, "yyyy-MM-ddT00:00:00.000Z") & "'",
                    endDateTimeVariable = "'" & Date.ToText(_, "yyyy-MM-ddT23:59:59.999Z") & "'",
                    apiCall = Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "admin/activityevents",
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ],
                                Query = [
                                    startDateTime = startDateTimeVariable,
                                    endDateTime = endDateTimeVariable,
                                    #"$filter" = "Activity eq 'AnalyzedByExternalApplication'"
                                ]
                            ]
                        )
                    ),
                    generator = List.Buffer(
                        List.Generate(
                            () =>
                                [
                                    result = apiCall,
                                    uri = result[continuationUri]?,
                                    lastResultSet = result[lastResultSet]?
                                ],
                            each [uri] <> null,
                            each
                                [
                                    result = Json.Document(
                                        Web.Contents(uri, [
                                            Headers = [
                                                #"Content-Type" = "application/json"
                                            ]
                                        ])
                                    ),
                                    uri = _[result][continuationUri]?,
                                    lastResultSet = _[result][lastResultSet]?
                                ],
                            each[result][activityEventEntities]?
                        )
                    ),
                    convertor = List.RemoveNulls(List.Combine(generator))
                in
                    convertor
        ),
        listOutputConvertor = List.RemoveNulls(List.Combine(transformator))
    in
        #table(
            type table [
                Id = text,
                RecordType = text,
                CreationTime = datetime,
                Operation = text,
                OrganizationId = text,
                UserType = text,
                UserKey = text,
                Workload = text,
                UserId = text,
                ClientIP = text,
                Activity = text,
                DatasetId = text,
                DatasetName = text,
                IsSuccess = logical,
                RequestId = text,
                ActivityId = text,
                EndPoint = text,
                UserAgent = text,
                ItemName = text,
                ObjectId = text
            ],
            List.Transform(
                listOutputConvertor,
                each
                    {
                        _[Id]?,
                        Text.From(_[RecordType]?),
                        DateTime.From(_[CreationTime]?),
                        _[Operation]?,
                        _[OrganizationId]?,
                        Text.From(_[UserType]?),
                        _[UserKey]?,
                        _[Workload]?,
                        _[UserId]?,
                        _[ClientIP]?,
                        _[Activity]?,
                        _[DatasetId]?,
                        _[DatasetName]?,
                        _[IsSuccess]?,
                        _[RequestId]?,
                        _[ActivityId]?,
                        _[EndPoint]?,
                        _[UserAgent]?,
                        _[ItemName]?,
                        _[ObjectId]?
                    }
            )
        );
//**** Exported Report By 30 Days
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.ExportedReportBy30Days = () =>
    let
        today = Date.From(DateTime.LocalNow()),
        startDate = Date.AddDays(today, -30),
        listofDates = List.Dates(startDate, Number.From(Date.AddDays(today, -1) - startDate), #duration(1, 0, 0, 0)),
        transformator = List.Transform(
            listofDates,
            each
                let
                    startDateTimeVariable = "'" & Date.ToText(_, "yyyy-MM-ddT00:00:00.000Z") & "'",
                    endDateTimeVariable = "'" & Date.ToText(_, "yyyy-MM-ddT23:59:59.999Z") & "'",
                    apiCall = Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "admin/activityevents",
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ],
                                Query = [
                                    startDateTime = startDateTimeVariable,
                                    endDateTime = endDateTimeVariable,
                                    #"$filter" = "Activity eq 'ExportReport'"
                                ]
                            ]
                        )
                    ),
                    generator = List.Buffer(
                        List.Generate(
                            () =>
                                [
                                    result = apiCall,
                                    uri = result[continuationUri]?,
                                    lastResultSet = result[lastResultSet]?
                                ],
                            each [uri] <> null,
                            each
                                [
                                    result = Json.Document(
                                        Web.Contents(uri, [
                                            Headers = [
                                                #"Content-Type" = "application/json"
                                            ]
                                        ])
                                    ),
                                    uri = _[result][continuationUri]?,
                                    lastResultSet = _[result][lastResultSet]?
                                ],
                            each[result][activityEventEntities]?
                        )
                    ),
                    convertor = List.RemoveNulls(List.Combine(generator))
                in
                    convertor
        ),
        listOutputConvertor = List.RemoveNulls(List.Combine(transformator))
    in
        #table(
            type table [
                Id = text,
                RecordType = text,
                CreationTime = datetime,
                Operation = text,
                OrganizationId = text,
                UserType = text,
                UserKey = text,
                Workload = text,
                UserId = text,
                ClientIP = text,
                UserAgent = text,
                Activity = text,
                ItemName = text,
                WorkSpaceName = text,
                DatasetName = text,
                ReportName = text,
                CapacityId = text,
                CapacityName = text,
                WorkspaceId = text,
                ObjectId = text,
                DatasetId = text,
                ReportId = text,
                ArtifactId = text,
                ArtifactName = text,
                IsSuccess = logical,
                ReportType = text,
                RequestId = text,
                ActivityId = text,
                DistributionMethod = text,
                ArtifactKind = text
            ],
            List.Transform(
                listOutputConvertor,
                each
                    {
                        _[Id]?,
                        Text.From(_[RecordType]?),
                        DateTime.From(_[CreationTime]?),
                        _[Operation]?,
                        _[OrganizationId]?,
                        Text.From(_[UserType]?),
                        _[UserKey]?,
                        _[Workload]?,
                        _[UserId]?,
                        _[ClientIP]?,
                        _[UserAgent]?,
                        _[Activity]?,
                        _[ItemName]?,
                        _[WorkSpaceName]?,
                        _[DatasetName]?,
                        _[ReportName]?,
                        _[CapacityId]?,
                        _[CapacityName]?,
                        _[WorkspaceId]?,
                        _[ObjectId]?,
                        _[DatasetId]?,
                        _[ReportId]?,
                        _[ArtifactId]?,
                        _[ArtifactName]?,
                        _[IsSuccess]?,
                        _[ReportType]?,
                        _[RequestId]?,
                        _[ActivityId]?,
                        _[DistributionMethod]?,
                        _[ArtifactKind]?
                    }
            )
        );
//** Functions Library
//**** Artifact Access
[
    DataSource.Kind = "pbiAdminAPI"
]
shared pbiAdminAPI.UserArtifactAccess = Value.ReplaceType(UserArtifactAccess, UserArtifactAccessType);

UserArtifactAccessType = type function (
    optional userIdentifier as (
        type text meta [
            Documentation.FieldCaption = "User Identifier",
            Documentation.FieldDescription = "UPN of user or Application ID",
            Documentation.SampleValues = {"example@domain.com"}
        ]
    )
) as table meta [
    Documentation.Name = "pbiAdminAPI.UserArtifactAccess",
    Documentation.LongDescription = "Returns all artifacts where user or application have access",
    Documentation.Examples = {
        [
            Code = "=pbiAdminAPI.UserArtifactAccess(""example@domain.com"")",
            Result = "Table with artifacts -> Columns: artifactId, displayName, artifactType, accessRight "
        ]
    }
];

UserArtifactAccess = (optional userIdentifier as text) =>
    let
        functionVarTester =
            if userIdentifier <> null and userIdentifier <> "" then
                let
                    path = "admin/users/" & userIdentifier & "/artifactAccess",
                    apiCall = Json.Document(
                        Web.Contents(
                            api_uri, [
                                RelativePath = path,
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ]
                            ]
                        )
                    ),
                    generator = List.Buffer(
                        List.Generate(
                            () => [
                                result = apiCall,
                                uriReturn = result[continuationUri]?
                            ],
                            each [uriReturn] <> null,
                            each
                                [
                                    result = Json.Document(
                                        Web.Contents(uriReturn, [
                                            Headers = [
                                                #"Content-Type" = "application/json"
                                            ]
                                        ])
                                    ),
                                    uriReturn = _[result][continuationUri]?
                                ],
                            each[result][ArtifactAccessEntities]?
                        )
                    ),
                    unitor = List.Union(generator),
                    output = #table(
                        type table [artifactId = text, displayName = text, artifactType = text, accessRight = text],
                        List.Transform(
                            List.RemoveNulls(unitor),
                            each {_[artifactId]?, _[displayName]?, _[artifactType]?, _[accessRight]?}
                        )
                    )
                in
                    output
            else
                #table(type table [Response = text], {{"Please fill parameter of function."}})
    in
        functionVarTester;

//**** Subscription
[
    DataSource.Kind = "pbiAdminAPI"
]
shared pbiAdminAPI.Subscriptions = Value.ReplaceType(Subscriptions, SubscriptionsType);

SubscriptionsType = type function (
    optional userIdentifier as (
        type text meta [
            Documentation.FieldCaption = "UPN",
            Documentation.FieldDescription = "UPN of user or Application ID",
            Documentation.SampleValues = {"example@domain.com"}
        ]
    )
) as table meta [
    Documentation.Name = "pbiAdminAPI.Subscriptions",
    Documentation.LongDescription = "Returns all subscriptions that user have",
    Documentation.Examples = {
        [
            Code = "=pbiAdminAPI.Subscriptions(""example@domain.com"")",
            Result = "Table with Subscriptions -> Columns: id, title, artifactId, artifactDisplayName, subArtifactDisplayName, artifactType, isEnabled, frequency, startDate, endDate, linkToContent, previewImage, attachmentFormat,users "
        ]
    }
];

Subscriptions = (optional userIdentifier as text) =>
    let
        functionVarTester =
            if userIdentifier <> null and userIdentifier <> "" then
                let
                    path = "admin/users/" & userIdentifier & "/subscriptions",
                    apiCall = Json.Document(
                        Web.Contents(
                            api_uri, [
                                RelativePath = path,
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ]
                            ]
                        )
                    ),
                    generator = List.Buffer(
                        List.Generate(
                            () => [
                                result = apiCall,
                                uriReturn = result[continuationUri]?
                            ],
                            each [uriReturn] <> null,
                            each
                                [
                                    result = Json.Document(
                                        Web.Contents(uriReturn, [
                                            Headers = [
                                                #"Content-Type" = "application/json"
                                            ]
                                        ])
                                    ),
                                    uriReturn = _[result][continuationUri]?
                                ],
                            each[result][SubscriptionEntities]?
                        )
                    ),
                    unitor = List.Union(generator),
                    output = #table(
                        type table [
                            id = text,
                            title = text,
                            artifactId = text,
                            artifactDisplayName = text,
                            subArtifactDisplayName = text,
                            artifactType = text,
                            isEnabled = logical,
                            frequency = text,
                            startDate = datetime,
                            endDate = datetime,
                            linkToContent = logical,
                            previewImage = logical,
                            attachmentFormat = text,
                            users = list
                        ],
                        List.Transform(
                            List.RemoveNulls(unitor),
                            each
                                {
                                    _[id]?,
                                    _[tite]?,
                                    _[artifactId]?,
                                    _[artifactDisplayName]?,
                                    _[subArtifactDisplayName]?,
                                    _[artifactType]?,
                                    _[isEnabled]?,
                                    _[frequency]?,
                                    DateTime.From(_[startDate]?),
                                    DateTime.From(_[endDate]?),
                                    _[linkToContent]?,
                                    _[previewImage]?,
                                    _[attachmentFormat]?,
                                    _[users]?
                                }
                        )
                    )
                in
                    output
            else
                #table(type table [Response = text], {{"Please fill parameter of function."}})
    in
        functionVarTester;

//**** Scorecards
[
    DataSource.Kind = "pbiAdminAPI"
]
shared pbiAdminAPI.Scorecards = Value.ReplaceType(Scorecards, ScorecardsType);

ScorecardsType = type function (
    optional workspaceId as (
        type text meta [
            Documentation.FieldCaption = "Workspace ID",
            Documentation.FieldDescription = "Workspace ID from where you want return the Scorecards",
            Documentation.SampleValues = {"xxx-xxxx-yyxa..."}
        ]
    )
) as table meta [
    Documentation.Name = "pbiAdminAPI.Scorecards",
    Documentation.LongDescription = "!!! This call can be used only on Groups where you have access !!!
        Returns all Scorecards that are in selected workspace",
    Documentation.Examples = {[
        Code = "=pbiAdminAPI.Scorecards(""xxx-xxxx-yyxa..."")",
        Result = ""
    ]}
];

Scorecards = (optional workspaceId as text) =>
    let
        functionVarTester =
            if workspaceId <> null and workspaceId <> "" then
                let
                    apiCall = Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "groups/" & workspaceId & "/scorecards",
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ]
                            ]
                        )
                    ),
                    output = #table(
                        type table [
                            id = text,
                            name = text,
                            contact = text,
                            lastModifiedBy = text,
                            createdTime = datetime,
                            lastModifiedTime = datetime,
                            provisioningStatus = text,
                            groupId = text,
                            datasetId = text,
                            reportId = text,
                            statuses = list,
                            permissions = text,
                            columnSettings = list
                        ],
                        List.Transform(
                            apiCall[value],
                            each
                                {
                                    _[id]?,
                                    _[name]?,
                                    _[contact]?,
                                    _[lastModifiedBy]?,
                                    DateTime.From(_[createdTime]?),
                                    DateTime.From(_[lastModifiedTime]?),
                                    _[provisioningStatus]?,
                                    _[groupId]?,
                                    _[datasetId]?,
                                    _[reportId]?,
                                    _[statuses]?,
                                    _[permissions]?,
                                    _[columnSettings]?
                                }
                        )
                    )
                in
                    output
            else
                #table(type table [Response = text], {{"Please fill parameter of function."}})
    in
        functionVarTester;

//**** Goals
[
    DataSource.Kind = "pbiAdminAPI"
]
shared pbiAdminAPI.Goals = Value.ReplaceType(Goals, GoalsType);

GoalsType = type function (
    optional workspaceId as (
        type text meta [
            Documentation.FieldCaption = "Workspace ID",
            Documentation.FieldDescription = "Workspace ID where is scorecard stored.",
            Documentation.SampleValues = {"xxx-xxxx-yyxa..."}
        ]
    ),
    optional scorecardId as (
        type text meta [
            Documentation.FieldCaption = "Scorecard ID",
            Documentation.FieldDescription = "Scorecard ID from where you want to recieve goals.",
            Documentation.SampleValues = {"xxx-xxxx-yyxa..."}
        ]
    )
) as table meta [
    Documentation.Name = "pbiAdminAPI.Goals",
    Documentation.LongDescription = "!!! This call can be used only on Groups where you have access !!!
        Returns all Goals that are from selected scorecard and in selected workspace.",
    Documentation.Examples = {[
        Code = "=pbiAdminAPI.Goals(""xxx-xxxx-yyxa..."",""xxx-xxxx-yyxa..."")",
        Result = ""
    ]}
];

Goals = (optional workspaceId as text, optional scorecardId as text) =>
    let
        functionVarTester =
            try
                if (workspaceId <> null and workspaceId <> "") and (scorecardId <> null and scorecardId <> "") then
                    let
                        apiCall = Json.Document(
                            Web.Contents(
                                api_uri,
                                [
                                    RelativePath = "groups/" & workspaceId & "/scorecards/" & scorecardId & "/goals",
                                    Headers = [
                                        #"Content-Type" = "application/json"
                                    ]
                                ]
                            )
                        ),
                        output = #table(
                            type table [
                                id = text,
                                name = text,
                                scorecardId = text,
                                lastModifiedBy = text,
                                createdTime = datetime,
                                owner = text,
                                unit = text,
                                lastModifiedTime = datetime,
                                startDate = datetime,
                                completionDate = datetime,
                                valueConnection = record,
                                notesCount = text,
                                valuesFormatString = text,
                                permissions = text,
                                level = text,
                                rank = text,
                                additionalOwners = list
                            ],
                            List.Transform(
                                apiCall[value],
                                each
                                    {
                                        _[id]?,
                                        _[name]?,
                                        _[scorecardId]?,
                                        _[lastModifiedBy]?,
                                        DateTime.From(_[createdTime]?),
                                        _[owner]?,
                                        _[unit]?,
                                        DateTime.From(_[lastModifiedTime]?),
                                        DateTime.From(_[startDate]?),
                                        DateTime.From(_[completionDate]?),
                                        _[valueConnection]?,
                                        _[notesCount]?,
                                        _[valuesFormatString]?,
                                        _[permissions]?,
                                        _[level]?,
                                        _[rank]?,
                                        _[additionalOwners]?
                                    }
                            )
                        )
                    in
                        output
                else
                    #table(type table [Response = text], {{"Please fill parameters of function."}})
            otherwise
                #table(
                    type table [Response = text],
                    {{"Hmm... Something is not quite right. Please check inserted parameters or try it later."}}
                )
    in
        functionVarTester;

//**** Goal Values and Notes
[
    DataSource.Kind = "pbiAdminAPI"
]
shared pbiAdminAPI.GoalValuesAndNotes = Value.ReplaceType(GoalValuesAndNotes, GoalValuesAndNotesType);

GoalValuesAndNotesType = type function (
    optional workspaceId as (
        type text meta [
            Documentation.FieldCaption = "Workspace ID",
            Documentation.FieldDescription = "Workspace ID where is scorecard stored.",
            Documentation.SampleValues = {"xxx-xxxx-yyxa..."}
        ]
    ),
    optional scorecardId as (
        type text meta [
            Documentation.FieldCaption = "Scorecard ID",
            Documentation.FieldDescription = "Scorecard ID from where you want to recieve Values and Notes.",
            Documentation.SampleValues = {"xxx-xxxx-yyxa..."}
        ]
    ),
    optional goalId as (
        type text meta [
            Documentation.FieldCaption = "Goal ID",
            Documentation.FieldDescription = "Goal ID from where you want to recieve Values and Notes.",
            Documentation.SampleValues = {"xxx-xxxx-yyxa..."}
        ]
    )
) as table meta [
    Documentation.Name = "pbiAdminAPI.GoalValuesAndNotes",
    Documentation.LongDescription = "!!! This call can be used only on Groups where you have access !!!
        Returns for selected goal its values and notes that are from selected scorecard and in selected workspace.",
    Documentation.Examples = {
        [
            Code = "=pbiAdminAPI.GoalValuesAndNotes(""xxx-xxxx-yyxa..."",""xxx-xxxx-yyxa..."",,""xxx-xxxx-yyxa..."")",
            Result = ""
        ]
    }
];

GoalValuesAndNotes = (optional workspaceId as text, optional scorecardId as text, optional goalId as text) =>
    let
        params = {workspaceId, scorecardId, goalId},
        functionVarTester =
            try
                if (not List.Contains(params, "")) and (not List.Contains(params, null)) then
                    let
                        apiCall = Json.Document(
                            Web.Contents(
                                api_uri,
                                [
                                    RelativePath = "groups/"
                                        & workspaceId
                                        & "/scorecards/"
                                        & scorecardId
                                        & "/goals("
                                        & goalId
                                        & ")/goalValues",
                                    Query = [
                                        #"$expand" = "notes"
                                    ],
                                    Headers = [
                                        #"Content-Type" = "application/json"
                                    ]
                                ]
                            )
                        ),
                        output = #table(
                            type table [
                                timestamp = datetime,
                                createdTime = datetime,
                                lastModifiedTime = datetime,
                                value = number,
                                target = number,
                                status = number,
                                notes = list
                            ],
                            List.Transform(
                                apiCall[value],
                                each
                                    {
                                        DateTime.From(_[timestamp]?),
                                        DateTime.From(_[createdTime]?),
                                        DateTime.From(_[lastModifiedTime]?),
                                        _[value]?,
                                        _[target]?,
                                        _[status]?,
                                        _[notes]?
                                    }
                            )
                        )
                    in
                        output
                else
                    #table(type table [Response = text], {{"Please fill parameters of function."}})
            otherwise
                #table(
                    type table [Response = text],
                    {{"Hmm... Something is not quite right. Please check inserted parameters or try it later."}}
                )
    in
        functionVarTester;

//** Scanner API
//**** Scanner API - GET INFO()
[
    DataSource.Kind = "pbiAdminAPI"
]
shared pbiAdminAPI.ScannerAPIInfo = Value.ReplaceType(ScannerAPIInfo, ScannerAPIInfoType);

ScannerAPIInfoType = type function (
    optional workspaceId as (
        type text meta [
            Documentation.FieldCaption = "Workspace ID",
            Documentation.FieldDescription = "Workspace ID on what will scanning will be started.",
            Documentation.SampleValues = {"xxx-xxxx-yyxa..."}
        ]
    ),
    optional listWithWokspaceIds as (
        type list meta [
            Documentation.FieldCaption = "List with Workspace IDs",
            Documentation.FieldDescription = "List of Workspace IDs on what will scanning will be started.",
            Documentation.SampleValues = {"{xxx-xxxx-yyxa...,xxx-xxxx-yyxa...}"}
        ]
    )
) as table meta [
    Documentation.Name = "pbiAdminAPI.ScannerAPIInfo",
    Documentation.LongDescription = "!!! This call only starts a scanning. For results of this scanning dont forget to call function for Results !!!
        Returns ONLY and ONLY ""Id"" of scanning that is required for other calls.",
    Documentation.Examples = {[
        Code = "=pbiAdminAPI.ScannerAPIInfo(""xxx-xxxx-yyxa..."")",
        Result = ""
    ]}
];

ScannerAPIInfo = (optional workspaceId as text, optional listWithWokspaceIds as list) =>
    let
        functionVarTester =
            if
                (workspaceId <> null and workspaceId <> "")
                or (listWithWokspaceIds <> null and listWithWokspaceIds <> {})
            then
                let
                    apiCall = (wsId as text) =>
                        Json.Document(
                            Web.Contents(
                                api_uri,
                                [
                                    RelativePath = "admin/workspaces/getInfo?lineage=True&datasourceDetails=True&datasetSchema=True&datasetExpressions=True&getArtifactUsers=True",
                                    Headers = [
                                        #"Content-Type" = "application/json"
                                    ],
                                    Content = Text.ToBinary("{ ""workspaces"": [ " & wsId & "]}")
                                ]
                            )
                        ),
                    ids =
                        if workspaceId = null then
                            let
                                split = List.Split(listWithWokspaceIds, 100),
                                transformator = List.Transform(
                                    split,
                                    each
                                        let
                                            insertedList = _,
                                            idCreator = """"
                                                & List.Accumulate(
                                                    List.RemoveFirstN(insertedList, 1),
                                                    List.First(insertedList),
                                                    (state, current) => state & """,""" & current
                                                )
                                                & """",
                                            call = apiCall(idCreator)
                                        in
                                            call
                                )
                            in
                                transformator
                        else
                            {apiCall("""" & workspaceId & """")},
                    output = #table(type table [#"Id of Scan" = text], List.Transform(ids, each {[id]?}))
                in
                    output
            else
                #table(type table [Response = text], {{"Please fill parameter of function."}})
    in
        functionVarTester;

//**** Scanner API - GET STATUS AND RESULTS
[
    DataSource.Kind = "pbiAdminAPI"
]
shared pbiAdminAPI.ScannerAPIStatusAndResult = Value.ReplaceType(
    ScannerAPIStatusAndResult, ScannerAPIStatusAndResultType
);

ScannerAPIStatusAndResultType = type function (
    optional scanId as (
        type text meta [
            Documentation.FieldCaption = "Scan ID",
            Documentation.FieldDescription = "Scan ID that has been returned from function ""Scanner API - Get Info""",
            Documentation.SampleValues = {"xxx-xxxx-yyxa..."}
        ]
    )
) as table meta [
    Documentation.Name = "pbiAdminAPI.ScannerAPIStatusAndResultType",
    Documentation.LongDescription = "This function will validate if the scan is successfully finished, and in that case, it returns data.",
    Documentation.Examples = {
        [
            Code = "=pbiAdminAPI.ScannerAPIStatusAndResultType(""xxx-xxxx-yyxa..."")",
            Result = ""
        ]
    }
];

ScannerAPIStatusAndResult = (optional scanId as text) =>
    let
        functionVarTester =
            if scanId <> null and scanId <> "" then
                let
                    statusCall = Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "admin/workspaces/scanStatus/" & scanId,
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ]
                            ]
                        )
                    )[status],
                    validationForNextSteps =
                        if statusCall = "Succeeded" then
                            let
                                resultCall = Json.Document(
                                    Web.Contents(
                                        api_uri,
                                        [
                                            RelativePath = "admin/workspaces/scanResult/" & scanId,
                                            Headers = [
                                                #"Content-Type" = "application/json"
                                            ]
                                        ]
                                    )
                                ),
                                resultOutput = #table(
                                    type table [
                                        id = text,
                                        name = text,
                                        #"type" = text,
                                        state = text,
                                        isOnDedicatedCapacity = text,
                                        capacityId = text,
                                        reports = list,
                                        dashboards = list,
                                        datasets = list,
                                        dataflows = list,
                                        datamarts = list,
                                        users = list
                                    ],
                                    List.Transform(
                                        resultCall[workspaces],
                                        each
                                            {
                                                _[id]?,
                                                _[name]?,
                                                _[#"type"]?,
                                                _[state]?,
                                                _[isOnDedicatedCapacity]?,
                                                _[capacityId]?,
                                                _[reports]?,
                                                _[dashboards]?,
                                                _[datasets]?,
                                                _[dataflows]?,
                                                _[datamarts]?,
                                                _[users]?
                                            }
                                    )
                                )
                            in
                                resultOutput
                        else
                            #table(type table [Response = text], {{"Scan is not completed yet. Try it later."}})
                in
                    validationForNextSteps
            else
                #table(type table [Response = text], {{"Please fill parameter of function."}})
    in
        functionVarTester;

//**** GroupsCaller
[
    DataSource.Kind = "pbiAdminAPI"
]
shared pbiAdminAPI.GroupsCaller = Value.ReplaceType(GroupsCaller, GroupsCallerType);

GroupsCallerType = type function (
    optional expandParameter as (
        type text meta [
            Documentation.FieldCaption = "expandParameter",
            Documentation.FieldDescription = "expandParameter represents what you want to expand. If you want to expand all, just leave it empty.",
            Documentation.SampleValues = {"users,reports,dashboards,..."}
        ]
    )
) as table meta [
    Documentation.Name = "pbiAdminAPI.GroupsCaller",
    Documentation.LongDescription = "This call can be used to easier extracting of workspaces and their content.",
    Documentation.Examples = {
        [
            Code = "=pbiAdminAPI.GroupsCaller(null)",
            Result = "With all expanding parameters"
        ],
        [
            Code = "=pbiAdminAPI.GroupsCaller(""users,reports,dashboards,datasets"")",
            Result = "With all selected expanding parameters"
        ],
        [
            Code = "=pbiAdminAPI.GroupsCaller("""")",
            Result = "Without any expanding parameters"
        ]
    }
];

GroupsCaller = (optional expandParameter as text) =>
    let
        expandParameters =
            if expandParameter = null then
                "users,reports,dashboards,datasets,dataflows,workbooks"
            else
                expandParameter,
        queryRecord = [#"$top" = "5000", #"$expand" = expandParameters],
        apiCall = List.Combine(List.Generate(
            () =>
                [
                    values = Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "admin/groups",
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ],
                                Query = queryRecord
                            ]
                        )
                    )[value]?,
                    index = 5000
                ],
            each not List.IsEmpty([values]),
            each
                [
                    values = Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "admin/groups",
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ],
                                Query = Record.AddField(queryRecord, "$skip", Text.From([index]))
                            ]
                        )
                    )[value]?,
                    index = [index] + 5000
                ],
            each [values]
        )),
        output = #table(
            type table [
                id = text,
                isReadOnly = logical,
                isOnDedicatedCapacity = logical,
                capacityId = text,
                capacityMigrationStatus = text,
                #"type" = text,
                state = text,
                name = text,
                users = list,
                reports = list,
                dashboards = list,
                datasets = list,
                dataflows = list,
                workbooks = list
            ],
            List.Transform(
                apiCall,
                each
                    {
                        _[id]?,
                        Logical.From(_[isReadOnly]?),
                        Logical.From(_[isOnDedicatedCapacity]?),
                        _[capacityId]?,
                        _[capacityMigrationStatus]?,
                        _[#"type"]?,
                        _[state]?,
                        _[name]?,
                        _[users]?,
                        _[reports]?,
                        _[dashboards]?,
                        _[datasets]?,
                        _[dataflows]?,
                        _[workbooks]?
                    }
            )
        )
    in
        output;

//**** Table of Datasets
[
    DataSource.Kind = "pbiAdminAPI"
] pbiAdminAPI.ScannerAPIModifiedWorkspaces = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                api_uri,
                [
                    RelativePath = "admin/workspaces/modified",
                    Headers = [
                        #"Content-Type" = "application/json"
                    ]
                ]
            )
        ),
        output = #table(type table [WorkspaceId = text], List.Transform(apiCall, each {_[id]}))
    in
        output;
//**** Execute Query
[
    DataSource.Kind = "pbiAdminAPI"
]
shared pbiAdminAPI.ExecuteQuery = Value.ReplaceType(ExecuteQuery, ExecuteQueryType);

ExecuteQueryType = type function (
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataset ID",
            Documentation.FieldDescription = "ID of dataset that you want to query.",
            Documentation.SampleValues = {"xxx-xxxx-yyxa..."}
        ]
    ),
    optional daxQuery as (
        type text meta [
            Documentation.FieldCaption = "DAX Query",
            Documentation.FieldDescription = "DAX Query that will be executed against dataset. Please dont include ""EVALUATE"" in a code. Connector will automaticaly adds it.",
            Documentation.SampleValues = {"VALUES(Table[Column])"}
        ]
    ),
    optional impersonateUPN as (
        type text meta [
            Documentation.FieldCaption = "UPN of Impersonated User",
            Documentation.FieldDescription = "UPN of user that you want to impersonate. !!! This parameter will work only against dataset with RLS !!!",
            Documentation.SampleValues = {"example@domain.com"}
        ]
    )
) as table meta [
    Documentation.Name = "pbiAdminAPI.ExecuteQuery",
    Documentation.LongDescription = "This call execute query by EXECUTE QUERY endpoint. It can be done only if you have this endpoint avaiable.",
    Documentation.Examples = {
        [
            Code = "=pbiAdminAPI.ExecuteQuery(""xxx-xxxx-yyxa..."",""xxx-xxxx-yyxa..."",""VALUES(Table[Column])"",""example@domain.com"")",
            Result = ""
        ]
    }
];

ExecuteQuery = (optional datasetId as text, optional daxQuery as text, optional impersonateUPN as text) =>
    let
        functionVarTester =
            if (datasetId <> null and datasetId <> "") and (daxQuery <> null and daxQuery <> "") then
                let
                    impersonate =
                        if impersonateUPN <> null and impersonateUPN <> "" then
                            ", ""impersonatedUserName"": """ & impersonateUPN & """"
                        else
                            "",
                    apiCall = Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "datasets/" & datasetId & "/executeQueries",
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ],
                                Content = Text.ToBinary(
                                    "
                                            {
                                                ""queries"":[
                                                    {
                                                        ""query"": ""EVALUATE "
                                        & daxQuery
                                        & """ 
                                                    }
                                                ],
                                                ""serializerSettings"":{
                                                    ""includeNulls"": false
                                                }"
                                        & impersonate
                                        & "
                                            }
                                            "
                                )
                            ]
                        )
                    ),
                    output =
                        let
                            initSource = apiCall[results]?{0} ?[tables]?{0} ?[rows]?,
                            namesOfColumns = List.Buffer(Record.FieldNames(initSource{0})),
                            correctedColumnsNames = List.Transform(
                                namesOfColumns, each Text.BetweenDelimiters(_, "[", "]")
                            ),
                            tableCreator = Table.FromList(initSource, Record.FieldValues, correctedColumnsNames)
                        in
                            tableCreator
                in
                    output
            else
                #table(type table [Response = text], {{"Please fill parameters of function."}})
    in
        functionVarTester;

// Own API Call
[
    DataSource.Kind = "pbiAdminAPI"
]
shared pbiAdminAPI.OwnAPICall = Value.ReplaceType(OwnAPICall, OwnAPICallType);

OwnAPICallType = type function (
    optional subUrl as (
        type text meta [
            Documentation.FieldCaption = "Relative Path",
            Documentation.FieldDescription = "Relative Path of URL that will be added to https://api.powerbi.com/v1.0/myorg.",
            Documentation.SampleValues = {"admin/dataflows"}
        ]
    ),
    optional callQuery as (
        type text meta [
            Documentation.FieldCaption = "HTTP Query",
            Documentation.FieldDescription = "HTTP Query that will be added to URL.",
            Documentation.SampleValues = {"$top=10&$skip=0"}
        ]
    ),
    optional callContent as (
        type record meta [
            Documentation.FieldCaption = "Content",
            Documentation.FieldDescription = "Record with content that you want to be send against the API.",
            Documentation.SampleValues = {"[datasets=""xxx-xxxx-yyxa...""]"}
        ]
    )
) as table meta [
    Documentation.Name = "pbiAdminAPI.OwnAPICall",
    Documentation.LongDescription = "",
    Documentation.Examples = {
        [
            Code = "=pbiAdminAPI.OwnAPICall(""admin/datawlows"",""$top=10&$skip=0"",null)",
            Result = ""
        ]
    }
];

OwnAPICall = (optional subUrl as text, optional callQuery as text, optional callContent as record) =>
    let
        functionVarTester =
            if (subUrl <> null and subUrl <> "") then
                let
                    apiRecord =
                        let
                            initialRecord = [
                                RelativePath = subUrl,
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ]
                            ],
                            apiQuery = if callQuery = null then [] else [
                                Query = callQuery
                            ],
                            apiContent =
                                if callContent = null then
                                    []
                                else
                                    [
                                        Content = Text.ToBinary(Uri.BuildQueryString(callContent))
                                    ],
                            apiRecordCombined = Record.Combine({initialRecord, apiQuery, apiContent})
                        in
                            apiRecordCombined,
                    apiCall = Json.Document(Web.Contents(api_uri, apiRecord))
                in
                    apiCall
            else
                #table(type table [Response = text], {{"Please fill parameters of function."}})
    in
        functionVarTester;

// UI Definition
pbiAdminAPI.UI = [
    Beta = true,
    Category = "Power Platform",
    ButtonText = {Extension.LoadString("ButtonTitle"), Extension.LoadString("ButtonHelp")},
    LearnMoreUrl = learn_more_uri,
    SourceImage = pbiAdminAPI.Icons,
    SourceTypeImage = pbiAdminAPI.Icons
];
pbiAdminAPI.Icons = [
    Icon16 = {
        Extension.Contents("PBIADMINAPI48.png"),
        Extension.Contents("PBIADMINAPI48.png"),
        Extension.Contents("PBIADMINAPI48.png"),
        Extension.Contents("PBIADMINAPI32.png")
    },
    Icon32 = {
        Extension.Contents("PBIADMINAPI48.png"),
        Extension.Contents("PBIADMINAPI48.png"),
        Extension.Contents("PBIADMINAPI48.png"),
        Extension.Contents("PBIADMINAPI64.png")
    }
];

// Navigation Tables Funcions
Table.ToNavigationTable = (
    table as table,
    keyColumns as list,
    nameColumn as text,
    dataColumn as text,
    itemKindColumn as text,
    itemNameColumn as text,
    isLeafColumn as text
) as table =>
    let
        tableType = Value.Type(table),
        newTableType = Type.AddTableKey(tableType, keyColumns, true) meta [
            NavigationTable.NameColumn = nameColumn,
            NavigationTable.DataColumn = dataColumn,
            NavigationTable.ItemKindColumn = itemKindColumn,
            Preview.DelayColumn = itemNameColumn,
            NavigationTable.IsLeafColumn = isLeafColumn
        ],
        navigationTable = Value.ReplaceType(table, newTableType)
    in
        navigationTable;
Table.ForceToNavigationTable = (
    table as table,
    keyColumns as list,
    nameColumn as text,
    dataColumn as text,
    itemKindColumn as text,
    itemNameColumn as text,
    isLeafColumn as text
) as table =>
    let
        tableType = Value.Type(table),
        newTableType = Type.AddTableKey(tableType, keyColumns, true) meta [
            NavigationTable.NameColumn = nameColumn,
            NavigationTable.DataColumn = dataColumn,
            NavigationTable.ItemKindColumn = itemKindColumn,
            NavigationTable.IsLeafColumn = isLeafColumn
        ],
        navigationTable = Value.ReplaceType(table, newTableType)
    in
        navigationTable;
