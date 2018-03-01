# -*- mode: python -*-

block_cipher = None

options = [ ('v', None, 'OPTION'), ('W ignore', None, 'OPTION') ]
a = Analysis(['wrapper.py'],
             pathex=['.'],
             binaries=[],
             datas=[],
             hiddenimports=["hy.core.language", ],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          options,
          exclude_binaries=True,
          name='wrapper',
          debug=True,
          strip=False,
          upx=False,
          console=True )
coll = COLLECT(exe,
               a.binaries,
               a.zipfiles,
               a.datas,
               strip=False,
               upx=False,
               name='wrapper')
