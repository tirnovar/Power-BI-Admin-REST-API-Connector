![Logo](https://github.com/tirnovar/Power-BI-Admin-REST-API-Connector/blob/main/02%20-%20Source%20for%20Connector/Icon/Exported/PBIADMINAPI80.png) 
# Power BI Admin Connector (via REST API)
[![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/%C5%A1t%C4%9Bp%C3%A1n-re%C5%A1l-464084152/) [![Twitter](https://img.shields.io/badge/twitter-%231DA1F2.svg?style=for-the-badge&logo=Twitter&logoColor=white)](https://twitter.com/tpnRel1)

## Basic Info
This connector is working with Power BI REST API. This API has limitations on every call, permissions, and data structure. Also, this API is under continuous development, so sometimes something stops working, or a new call appears. Complete info about this API you can find [HERE](https://docs.microsoft.com/en-gb/rest/api/power-bi/?redirectedfrom=MSDN).

## Actual categories in Connector:
**FOR ALL THESE TOPICS IS REQUIRED TO HAVE POWER ADMIN RIGHTS**
ID | Name | Description
-- | ---- | ----------- 
0 | Generic Informations About Tenant | Returns tables that are containing generinc informations about tenant like <code> Unused Artifacts</code>.
1 | Gateways | Contains information about gateways in tenants, even about personal gateways.
2 | Capacities | Contains information about capacities in tenants.
3 | Groups & Workspaces | Returns all groups and workspace in a tenant.
4 | Deployment Pipelines | Returns all deployment pipelines with their assigned groups and their tag by deployment progress.
5 | Dataflows | Returns all dataflows in a tenant
6 | Datasets | Contains table of all datasets and their refresh history in tenant but also it contains function for recieving refresh history of exact datasets.
7 | Reports | Returns all reports in a tenant.
8 | Dashboard | Return all dashboard in tenant and their tiles.
9 | Metrics | Contains function to get Scorecards and Goals from selected Group (**YOU NEED TO HAVE ACCESS INTO ITS GROUP**)
10 | Apps | Returns all apps in a tenant.
11 | Scanner API Functions | Library of functions dedicated to Scanner API.
12 | Activity Events | Log of events that happened in Power BI Service.
99 | Functions library | Special functions that can be used for further Admin view about tenant.

## Functions hierarchy
<details>
<summary>Show hierarchy map of functions</summary>

    Power BI ADMIN REST API [Connector]
    ├── Generic Informations About Tenant 
    │   ├── Avaiable Features
    │   ├── Encryption Tenant Keys
    │   ├── Imports
    │   ├── Links shared to whole organization
    │   ├── Reports published to Web
    │   └── Unused Artifacts in Groups (All)
    ├── Gateways
    │   ├── Gateways
    │   ├── Gateways under my Administration
    │   └── Datasources of gatewas under my Administration
    ├── Capacities
    │   ├── Capacities
    │   └── Users of Capacities
    ├── Groups & Workspaces
    │   └── Groups
    ├── Deployment Pipelines
    │   └── Deployment Pipelines
    ├── Dataflows
    │   ├── Dataflows
    │   ├── Users of Dataflows
    │   ├── Datasources of Dataflows
    │   └── Storage Accounts assigned with Dataflows
    ├── Datasets
    │   ├── Datasets
    │   ├── Refreshables
    │   ├── Refresh history of Datasets (All)
    │   ├── (fx) Datasources of Dataset
    │   ├── (fx) Parameters of Dataset
    │   └── (fx) Refresh history of Dataset
    ├── Reports
    │   ├── Reports
    │   ├── Users of Reports
    │   └── Subscriptions of Reports
    ├── Dashboard
    │   ├── Dashboards
    │   ├── Users of Dashboards
    │   ├── Subscriptions of Dashboards
    │   └── Tiles from Dashboards (All)
    ├── Metrics
    │   ├── (fx) Goals
    │   ├── (fx) Goal Values and Notes
    │   └── (fx) Scorecards
    ├── Apps
    │   ├── Apps
    │   └── Users of Apps
    ├── Scanner API Functions
    │   ├── Scanner API - Modified Workspaces
    │   ├── (fx) Scanner API - Get Info
    │   └── (fx) Scanner API - Result
    ├── Activity Events
    │   ├── Activity Events in last 30 days
    │   ├── Activity Events before two days
    └── Functions library
        ├── (fx) Execute Query against dataset
        ├── (fx) Own API Call
        ├── (fx) User - Artifact Access
        └── (fx) User - Subscriptions
        
</details>

## Authentication method
- by Organizational Account *(most of the calls require Power BI Admin Permissions)*

## Installing steps
1) Download actual version of connector (.mez file) from [Connector Folder](https://github.com/tirnovar/Power-BI-Admin-REST-API-Connector/tree/main/01%20-%20Connector)
2) Put this file into folder path: <code> C:\Users\{username}\Documents\Power BI Desktop\Custom Connectors\ </code>
3) In Power BI Desktop allow using of Custom Connector: \
  *File -> Options and Settings -> Options -> Security -> (Not Recommended) Allow any extension to load without validation or warning*
4) Restart whole Power BI Desktop
5) Find custom connector under: *Get Data -> Power Platform*

## Backlog of topics and fixes
<details>
<summary>Show backlog</summary>

- Data Labels
- Function for Unused Artifacts (by Workspace ID)
- Function for Datasets to Dataflow Links (Dataset ID)

</details>

## Feedback & Commentary
This repository is public and open. You can make pull requests. Feedback can be provided by opening the Issue Ticket.
