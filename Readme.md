# Power BI ADMIN Custom connector (REST API) - UNDER CONSTRUCTION
[![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/%C5%A1t%C4%9Bp%C3%A1n-re%C5%A1l-464084152/) [![Twitter](https://img.shields.io/badge/twitter-%231DA1F2.svg?style=for-the-badge&logo=Twitter&logoColor=white)](https://twitter.com/tpnRel1)

## Actual categories in Connector:
**FOR ALL THESE TOPICS IS REQUIRED TO HAVE POWER ADMIN RIGHTS**
ID | Name | Description
-- | ---- | ----------- 
0 | Generic Informations About Tenant | Returns tables that are containing generinc informations about tenant like <code> Capacities </code>.
1 | Gateways | Contains information about gateways in tenants, even about personal gateways.
2 | Groups & Workspaces | Returns all groups and workspace in a tenant.
3 | Deployment Pipelines | Returns all deployment pipelines with their assigned groups and their tag by deployment progress.
4 | Dataflows | Returns all dataflows in a tenant
5 | Datasets | Contains table of all datasets and their refresh history in tenant but also it contains function for recieving refresh history of exact datasets.
6 | Reports | Returns all reports in a tenant.
7 | Dashboard | Return all dashboard in tenant and their tiles.
8 | Metrics | Contains function to get Scorecards and Goals from selected Group (**YOU NEED TO HAVE ACCESS INTO ITS GROUP**)
9 | Apps | Returns all apps in a tenant.
10 | Scanner API Functions | Library of functions dedicated to Scanner API.
99 | Functions library | Special functions that can be used for further Admin view about tenant.

## Functions hierarchy
<details>
<summary>Show hierarchy map of functions</summary>

    Power BI ADMIN REST API [Connector]
    ├── Generic Informations About Tenant 
    │   ├── Avaiable Features
    │   ├── Capacities
    │   ├── Encryption Tenant Keys
    │   ├── Imports
    │   ├── Links shared to whole organization
    │   ├── Reports published to Web
    │   └── Unused Artifacts in Groups (All)
    ├── Gateways
    │   └── Gateways
    ├── Groups & Workspaces
    │   └── Groups
    ├── Deployment Pipelines
    │   └── Deployment Pipelines
    ├── Dataflows
    │   ├── Dataflows
    │   └── Storage Accounts assigned with Dataflows
    ├── Datasets
    │   ├── Datasets
    │   ├── Refreshables
    │   ├── Refresh history of Datasets (All)
    │   ├── (fx) Datasources of Dataset
    │   ├── (fx) Parameters of Dataset
    │   └── (fx) Refresh history of Dataset
    ├── Reports
    │   └── Reports
    ├── Dashboard
    │   ├── Dashboards
    │   └── Tiles from Dashboards (All)
    ├── Metrics
    │   ├── (fx) Goals
    │   └── (fx) Scorecards
    ├── Apps
    │   └── Apps
    ├── Scanner API Functions
    │   ├── (fx) Scanner API - Get Info
    │   └── (fx) Scanner API - Result
    └── Functions library
        ├── (fx) Execute Query against dataset
        ├── (fx) User - Artifact Access
        └── (fx) User - Subscriptions
        
</details>

## Authentication method
- by Organizational Account

## Installing steps
1) Download actual version of connector (.mez file) from [Connector Folder](https://github.com/tirnovar/Power-BI-Admin-REST-API-Connector/tree/main/01%20-%20Connector)
2) Put this file into folder path: <code> C:\Users\{username}\Documents\Power BI Desktop\Custom Connectors\ </code>
3) In Power BI Desktop allow using of Custom Connector: \
  *File -> Options and Settings -> Options -> Security -> (Not Recommended) Allow any extension to load without validation or warning*
4) Restart whole Power BI Desktop
5) Find custom connector under: *Get Data -> Power Platform*

## Feedback & Commentary
This repository is public and open. You can make pull requests. Feedback can be provided by opening the Issue Ticket.
