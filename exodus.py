# exodus.py （来自 SEACAS 官方修改版）
# Minimal subset to allow reading/modifying block IDs

import netCDF4

class exodus:
    def __init__(self, filename, mode='r'):
        self.filename = filename
        self.nc = netCDF4.Dataset(filename, mode)

    def close(self):
        self.nc.close()

    def get_elem_blk_ids(self):
        return list(self.nc.variables['eb_prop1'][:])

    def set_elem_blk_id(self, idx, new_id):
        self.nc.variables['eb_prop1'][idx] = new_id
