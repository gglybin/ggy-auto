# Convert Non-CDB database to PDB and plug it into created CDB :office:

> :heavy_exclamation_mark: This is for test/dev environments only.

## Estimate Time

TOTAL ~ 1h

## Compatibility

RedHat Releases 7, 8 (x86_64)

Oracle Database 12c (12.1.0.2), 19c - Standalone.

## Notes

:point_right: Downtime is required for your current Non-CDB database. It will be down during all time of CDB creation process.

:point_right: Ensure you have enough free disk space for CDB and PDB databases.

:point_right: CDB will be created with all components, except APEX - it will not be installed. Check table below for detailed list:

| COMP_ID     |               COMP_NAME            |                 STATUS              |
|-------------|------------------------------------|-------------------------------------|
| RAC         | Oracle Real Application Clusters   |  OPTION OFF                         |
| CATALOG     | Oracle Database Catalog Views      |  VALID                              |
| CATPROC     | Oracle Database Packages and Types |  VALID                              |
| XDB         | Oracle XML Database                |  VALID                              |
| OWM         | Oracle Workspace Manager           |  VALID                              |
| JAVAVM      | JServer JAVA Virtual Machine       |  VALID                              |
| XML         | Oracle XDK                         |  VALID                              |
| APS         | OLAP Analytic Workspace            |  VALID                              |
| ORDIM       | Oracle Multimedia                  |  VALID                              |
| CATJAVA     | Oracle Database Java Packages      |  VALID                              |
| CONTEXT     | Oracle Text                        |  VALID                              |
| SDO         | Spatial                            |  VALID                              |
| XOQ         | Oracle OLAP API                    |  VALID                              |
| DV          | Oracle Database Vault              |  VALID                              |
| OLS         | Oracle Label Security              |  VALID                              |
