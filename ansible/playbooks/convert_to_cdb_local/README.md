# Convert Non-CDB database to PDB and plug it into created CDB :office:

> :heavy_exclamation_mark: This is for test/dev environments only.

## Estimate Time

TOTAL ~ 1h

## Compatibility

RedHat Releases 7, 8 (x86_64)

Oracle Database 12c(12.1.0.2), 19c

## Notes

:point_right: Downtime is required for your current Non-CDB database. It will be down during all time of CDB creation process.

:point_right: Ensure you have enough free disk space for CDB and PDB databases.

:point_right: CDB will be created with all components, except APEX - it will not be installed. Check table below for detailed list:

| COMP_ID     |               COMP_NAME            |
|-------------|:----------------------------------:|
| RAC         | Oracle Real Application Clusters   |
| CATALOG     | Oracle Database Catalog Views      |
| CATPROC     | Oracle Database Packages and Types |
| XDB         | Oracle XML Database                |
| OWM         | Oracle Workspace Manager           |
| JAVAVM      | JServer JAVA Virtual Machine       |
| XML         | Oracle XDK                         |
| APS         | OLAP Analytic Workspace            |
| ORDIM       | Oracle Multimedia                  |
| CATJAVA     | Oracle Database Java Packages      |
| CONTEXT     | Oracle Text                        |
| SDO         | Spatial                            |
| XOQ         | Oracle OLAP API                    |
| DV          | Oracle Database Vault              |
| OLS         | Oracle Label Security              |
