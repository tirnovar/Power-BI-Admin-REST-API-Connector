# Power BI ADMIN Custom connector (REST API) - UNDER CONSTRUCTION

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
8 | Metrics | Contains function to get Scorecards and Goals from selected Group (**YOU NEED TO HAVE ACCESS INTO THIS GROUP**)
9 | Apps | Returns all apps in a tenant.
10 | Scanner API Functions | Library of functions dedicated to Scanner API.
99 | Functions library | Special functions that can be used for further Admin view about tenant.

## Authentication method
- by Organizational Account

## Installing steps
1) Download actual version of connector (.mez file) from [Connector Folder](https://github.com/tirnovar/Power-BI-Admin-REST-API-Connector/tree/main/01%20-%20Connector)
2) Put this file into folder path: <code> C:\Users\{username}\Documents\Power BI Desktop\Custom Connectors\ </code>
3) In Power BI Desktop allow using of Custom Connector: \
  *File -> Options and Settings -> Options -> Security -> (Not Recommended) Allow any extension to load without validation or warning*
4) Restart whole Power BI Desktop
5) Find custom connector under: *Get Data -> Power Platform*
