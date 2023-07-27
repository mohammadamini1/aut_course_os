
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	bb 01 00 00 00       	mov    $0x1,%ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 1f                	jle    42 <main+0x42>
  23:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  27:	90                   	nop
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 34 9f             	pushl  (%edi,%ebx,4)
  for(i=1; i<argc; i++)
  2e:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
  31:	e8 ca 00 00 00       	call   100 <ls>
  for(i=1; i<argc; i++)
  36:	83 c4 10             	add    $0x10,%esp
  39:	39 de                	cmp    %ebx,%esi
  3b:	75 eb                	jne    28 <main+0x28>
  exit();
  3d:	e8 52 06 00 00       	call   694 <exit>
    ls(".");
  42:	83 ec 0c             	sub    $0xc,%esp
  45:	68 b0 0b 00 00       	push   $0xbb0
  4a:	e8 b1 00 00 00       	call   100 <ls>
    exit();
  4f:	e8 40 06 00 00       	call   694 <exit>
  54:	66 90                	xchg   %ax,%ax
  56:	66 90                	xchg   %ax,%ax
  58:	66 90                	xchg   %ax,%ax
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <fmtname>:
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  68:	83 ec 0c             	sub    $0xc,%esp
  6b:	56                   	push   %esi
  6c:	e8 4f 03 00 00       	call   3c0 <strlen>
  71:	83 c4 10             	add    $0x10,%esp
  74:	01 f0                	add    %esi,%eax
  76:	89 c3                	mov    %eax,%ebx
  78:	73 0f                	jae    89 <fmtname+0x29>
  7a:	eb 12                	jmp    8e <fmtname+0x2e>
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  83:	39 c6                	cmp    %eax,%esi
  85:	77 0a                	ja     91 <fmtname+0x31>
  87:	89 c3                	mov    %eax,%ebx
  89:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  8c:	75 f2                	jne    80 <fmtname+0x20>
  p++;
  8e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	53                   	push   %ebx
  95:	e8 26 03 00 00       	call   3c0 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 4a                	ja     ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	53                   	push   %ebx
  a6:	e8 15 03 00 00       	call   3c0 <strlen>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	50                   	push   %eax
  af:	53                   	push   %ebx
  b0:	68 80 0f 00 00       	push   $0xf80
  b5:	e8 a6 04 00 00       	call   560 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ba:	89 1c 24             	mov    %ebx,(%esp)
  bd:	e8 fe 02 00 00       	call   3c0 <strlen>
  c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  c5:	bb 80 0f 00 00       	mov    $0xf80,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	89 c6                	mov    %eax,%esi
  cc:	e8 ef 02 00 00       	call   3c0 <strlen>
  d1:	ba 0e 00 00 00       	mov    $0xe,%edx
  d6:	83 c4 0c             	add    $0xc,%esp
  d9:	29 f2                	sub    %esi,%edx
  db:	05 80 0f 00 00       	add    $0xf80,%eax
  e0:	52                   	push   %edx
  e1:	6a 20                	push   $0x20
  e3:	50                   	push   %eax
  e4:	e8 07 03 00 00       	call   3f0 <memset>
  return buf;
  e9:	83 c4 10             	add    $0x10,%esp
}
  ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ef:	89 d8                	mov    %ebx,%eax
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret    
  f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000100 <ls>:
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	57                   	push   %edi
 104:	56                   	push   %esi
 105:	53                   	push   %ebx
 106:	81 ec 64 02 00 00    	sub    $0x264,%esp
 10c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 10f:	6a 00                	push   $0x0
 111:	57                   	push   %edi
 112:	e8 bd 05 00 00       	call   6d4 <open>
 117:	83 c4 10             	add    $0x10,%esp
 11a:	85 c0                	test   %eax,%eax
 11c:	0f 88 9e 01 00 00    	js     2c0 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
 122:	83 ec 08             	sub    $0x8,%esp
 125:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 12b:	89 c3                	mov    %eax,%ebx
 12d:	56                   	push   %esi
 12e:	50                   	push   %eax
 12f:	e8 b8 05 00 00       	call   6ec <fstat>
 134:	83 c4 10             	add    $0x10,%esp
 137:	85 c0                	test   %eax,%eax
 139:	0f 88 c1 01 00 00    	js     300 <ls+0x200>
  switch(st.type){
 13f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 146:	66 83 f8 01          	cmp    $0x1,%ax
 14a:	74 64                	je     1b0 <ls+0xb0>
 14c:	66 83 f8 02          	cmp    $0x2,%ax
 150:	74 1e                	je     170 <ls+0x70>
  close(fd);
 152:	83 ec 0c             	sub    $0xc,%esp
 155:	53                   	push   %ebx
 156:	e8 61 05 00 00       	call   6bc <close>
 15b:	83 c4 10             	add    $0x10,%esp
}
 15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 161:	5b                   	pop    %ebx
 162:	5e                   	pop    %esi
 163:	5f                   	pop    %edi
 164:	5d                   	pop    %ebp
 165:	c3                   	ret    
 166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 170:	83 ec 0c             	sub    $0xc,%esp
 173:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 179:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 17f:	57                   	push   %edi
 180:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 186:	e8 d5 fe ff ff       	call   60 <fmtname>
 18b:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 191:	59                   	pop    %ecx
 192:	5f                   	pop    %edi
 193:	52                   	push   %edx
 194:	56                   	push   %esi
 195:	6a 02                	push   $0x2
 197:	50                   	push   %eax
 198:	68 90 0b 00 00       	push   $0xb90
 19d:	6a 01                	push   $0x1
 19f:	e8 5c 06 00 00       	call   800 <printf>
    break;
 1a4:	83 c4 20             	add    $0x20,%esp
 1a7:	eb a9                	jmp    152 <ls+0x52>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	57                   	push   %edi
 1b4:	e8 07 02 00 00       	call   3c0 <strlen>
 1b9:	83 c4 10             	add    $0x10,%esp
 1bc:	83 c0 10             	add    $0x10,%eax
 1bf:	3d 00 02 00 00       	cmp    $0x200,%eax
 1c4:	0f 87 16 01 00 00    	ja     2e0 <ls+0x1e0>
    strcpy(buf, path);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	57                   	push   %edi
 1ce:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1d4:	57                   	push   %edi
 1d5:	e8 66 01 00 00       	call   340 <strcpy>
    p = buf+strlen(buf);
 1da:	89 3c 24             	mov    %edi,(%esp)
 1dd:	e8 de 01 00 00       	call   3c0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1e5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 1e7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 1ea:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 1f0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1f6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	83 ec 04             	sub    $0x4,%esp
 203:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 209:	6a 10                	push   $0x10
 20b:	50                   	push   %eax
 20c:	53                   	push   %ebx
 20d:	e8 9a 04 00 00       	call   6ac <read>
 212:	83 c4 10             	add    $0x10,%esp
 215:	83 f8 10             	cmp    $0x10,%eax
 218:	0f 85 34 ff ff ff    	jne    152 <ls+0x52>
      if(de.inum == 0)
 21e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 225:	00 
 226:	74 d8                	je     200 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 231:	6a 0e                	push   $0xe
 233:	50                   	push   %eax
 234:	ff b5 a4 fd ff ff    	pushl  -0x25c(%ebp)
 23a:	e8 21 03 00 00       	call   560 <memmove>
      p[DIRSIZ] = 0;
 23f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 245:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 249:	58                   	pop    %eax
 24a:	5a                   	pop    %edx
 24b:	56                   	push   %esi
 24c:	57                   	push   %edi
 24d:	e8 7e 02 00 00       	call   4d0 <stat>
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	0f 88 cb 00 00 00    	js     328 <ls+0x228>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 25d:	83 ec 0c             	sub    $0xc,%esp
 260:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 266:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 26c:	57                   	push   %edi
 26d:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 274:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 27a:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 280:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 286:	e8 d5 fd ff ff       	call   60 <fmtname>
 28b:	5a                   	pop    %edx
 28c:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 292:	59                   	pop    %ecx
 293:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 299:	51                   	push   %ecx
 29a:	52                   	push   %edx
 29b:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
 2a1:	50                   	push   %eax
 2a2:	68 90 0b 00 00       	push   $0xb90
 2a7:	6a 01                	push   $0x1
 2a9:	e8 52 05 00 00       	call   800 <printf>
 2ae:	83 c4 20             	add    $0x20,%esp
 2b1:	e9 4a ff ff ff       	jmp    200 <ls+0x100>
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "ls: cannot open %s\n", path);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	57                   	push   %edi
 2c4:	68 68 0b 00 00       	push   $0xb68
 2c9:	6a 02                	push   $0x2
 2cb:	e8 30 05 00 00       	call   800 <printf>
    return;
 2d0:	83 c4 10             	add    $0x10,%esp
}
 2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop
      printf(1, "ls: path too long\n");
 2e0:	83 ec 08             	sub    $0x8,%esp
 2e3:	68 9d 0b 00 00       	push   $0xb9d
 2e8:	6a 01                	push   $0x1
 2ea:	e8 11 05 00 00       	call   800 <printf>
      break;
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	e9 5b fe ff ff       	jmp    152 <ls+0x52>
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot stat %s\n", path);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	57                   	push   %edi
 304:	68 7c 0b 00 00       	push   $0xb7c
 309:	6a 02                	push   $0x2
 30b:	e8 f0 04 00 00       	call   800 <printf>
    close(fd);
 310:	89 1c 24             	mov    %ebx,(%esp)
 313:	e8 a4 03 00 00       	call   6bc <close>
    return;
 318:	83 c4 10             	add    $0x10,%esp
}
 31b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31e:	5b                   	pop    %ebx
 31f:	5e                   	pop    %esi
 320:	5f                   	pop    %edi
 321:	5d                   	pop    %ebp
 322:	c3                   	ret    
 323:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 327:	90                   	nop
        printf(1, "ls: cannot stat %s\n", buf);
 328:	83 ec 04             	sub    $0x4,%esp
 32b:	57                   	push   %edi
 32c:	68 7c 0b 00 00       	push   $0xb7c
 331:	6a 01                	push   $0x1
 333:	e8 c8 04 00 00       	call   800 <printf>
        continue;
 338:	83 c4 10             	add    $0x10,%esp
 33b:	e9 c0 fe ff ff       	jmp    200 <ls+0x100>

00000340 <strcpy>:

struct ptr_struct ptrs[64];

char *
strcpy(char *s, const char *t)
{
 340:	55                   	push   %ebp
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 341:	31 c0                	xor    %eax,%eax
{
 343:	89 e5                	mov    %esp,%ebp
 345:	53                   	push   %ebx
 346:	8b 4d 08             	mov    0x8(%ebp),%ecx
 349:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0)
 350:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 354:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 357:	83 c0 01             	add    $0x1,%eax
 35a:	84 d2                	test   %dl,%dl
 35c:	75 f2                	jne    350 <strcpy+0x10>
    ;
  return os;
}
 35e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 361:	89 c8                	mov    %ecx,%eax
 363:	c9                   	leave  
 364:	c3                   	ret    
 365:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000370 <strcmp>:

int strcmp(const char *p, const char *q)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	53                   	push   %ebx
 374:	8b 4d 08             	mov    0x8(%ebp),%ecx
 377:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 37a:	0f b6 01             	movzbl (%ecx),%eax
 37d:	0f b6 1a             	movzbl (%edx),%ebx
 380:	84 c0                	test   %al,%al
 382:	75 1d                	jne    3a1 <strcmp+0x31>
 384:	eb 2a                	jmp    3b0 <strcmp+0x40>
 386:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38d:	8d 76 00             	lea    0x0(%esi),%esi
 390:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 394:	83 c1 01             	add    $0x1,%ecx
 397:	83 c2 01             	add    $0x1,%edx
  return (uchar)*p - (uchar)*q;
 39a:	0f b6 1a             	movzbl (%edx),%ebx
  while (*p && *p == *q)
 39d:	84 c0                	test   %al,%al
 39f:	74 0f                	je     3b0 <strcmp+0x40>
 3a1:	38 d8                	cmp    %bl,%al
 3a3:	74 eb                	je     390 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 3a5:	29 d8                	sub    %ebx,%eax
}
 3a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3aa:	c9                   	leave  
 3ab:	c3                   	ret    
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 3b2:	29 d8                	sub    %ebx,%eax
}
 3b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3b7:	c9                   	leave  
 3b8:	c3                   	ret    
 3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003c0 <strlen>:

uint strlen(const char *s)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for (n = 0; s[n]; n++)
 3c6:	80 3a 00             	cmpb   $0x0,(%edx)
 3c9:	74 15                	je     3e0 <strlen+0x20>
 3cb:	31 c0                	xor    %eax,%eax
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
 3d0:	83 c0 01             	add    $0x1,%eax
 3d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3d7:	89 c1                	mov    %eax,%ecx
 3d9:	75 f5                	jne    3d0 <strlen+0x10>
    ;
  return n;
}
 3db:	89 c8                	mov    %ecx,%eax
 3dd:	5d                   	pop    %ebp
 3de:	c3                   	ret    
 3df:	90                   	nop
  for (n = 0; s[n]; n++)
 3e0:	31 c9                	xor    %ecx,%ecx
}
 3e2:	5d                   	pop    %ebp
 3e3:	89 c8                	mov    %ecx,%eax
 3e5:	c3                   	ret    
 3e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ed:	8d 76 00             	lea    0x0(%esi),%esi

000003f0 <memset>:

void *
memset(void *dst, int c, uint n)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fd:	89 d7                	mov    %edx,%edi
 3ff:	fc                   	cld    
 400:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 402:	8b 7d fc             	mov    -0x4(%ebp),%edi
 405:	89 d0                	mov    %edx,%eax
 407:	c9                   	leave  
 408:	c3                   	ret    
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000410 <strchr>:

char *
strchr(const char *s, char c)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	8b 45 08             	mov    0x8(%ebp),%eax
 416:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 41a:	0f b6 10             	movzbl (%eax),%edx
 41d:	84 d2                	test   %dl,%dl
 41f:	75 12                	jne    433 <strchr+0x23>
 421:	eb 1d                	jmp    440 <strchr+0x30>
 423:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 427:	90                   	nop
 428:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 42c:	83 c0 01             	add    $0x1,%eax
 42f:	84 d2                	test   %dl,%dl
 431:	74 0d                	je     440 <strchr+0x30>
    if (*s == c)
 433:	38 d1                	cmp    %dl,%cl
 435:	75 f1                	jne    428 <strchr+0x18>
      return (char *)s;
  return 0;
}
 437:	5d                   	pop    %ebp
 438:	c3                   	ret    
 439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 440:	31 c0                	xor    %eax,%eax
}
 442:	5d                   	pop    %ebp
 443:	c3                   	ret    
 444:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 44f:	90                   	nop

00000450 <gets>:

char *
gets(char *buf, int max)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 455:	31 f6                	xor    %esi,%esi
{
 457:	53                   	push   %ebx
 458:	89 f3                	mov    %esi,%ebx
 45a:	83 ec 1c             	sub    $0x1c,%esp
 45d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for (i = 0; i + 1 < max;)
 460:	eb 2f                	jmp    491 <gets+0x41>
 462:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  {
    cc = read(0, &c, 1);
 468:	83 ec 04             	sub    $0x4,%esp
 46b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 46e:	6a 01                	push   $0x1
 470:	50                   	push   %eax
 471:	6a 00                	push   $0x0
 473:	e8 34 02 00 00       	call   6ac <read>
    if (cc < 1)
 478:	83 c4 10             	add    $0x10,%esp
 47b:	85 c0                	test   %eax,%eax
 47d:	7e 1c                	jle    49b <gets+0x4b>
      break;
    buf[i++] = c;
 47f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    if (c == '\n' || c == '\r')
 483:	83 c7 01             	add    $0x1,%edi
    buf[i++] = c;
 486:	88 47 ff             	mov    %al,-0x1(%edi)
    if (c == '\n' || c == '\r')
 489:	3c 0a                	cmp    $0xa,%al
 48b:	74 23                	je     4b0 <gets+0x60>
 48d:	3c 0d                	cmp    $0xd,%al
 48f:	74 1f                	je     4b0 <gets+0x60>
  for (i = 0; i + 1 < max;)
 491:	83 c3 01             	add    $0x1,%ebx
    buf[i++] = c;
 494:	89 fe                	mov    %edi,%esi
  for (i = 0; i + 1 < max;)
 496:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 499:	7c cd                	jl     468 <gets+0x18>
 49b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 49d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 4a0:	c6 03 00             	movb   $0x0,(%ebx)
}
 4a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a6:	5b                   	pop    %ebx
 4a7:	5e                   	pop    %esi
 4a8:	5f                   	pop    %edi
 4a9:	5d                   	pop    %ebp
 4aa:	c3                   	ret    
 4ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4af:	90                   	nop
  buf[i] = '\0';
 4b0:	8b 75 08             	mov    0x8(%ebp),%esi
}
 4b3:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 4b6:	01 de                	add    %ebx,%esi
 4b8:	89 f3                	mov    %esi,%ebx
 4ba:	c6 03 00             	movb   $0x0,(%ebx)
}
 4bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4c0:	5b                   	pop    %ebx
 4c1:	5e                   	pop    %esi
 4c2:	5f                   	pop    %edi
 4c3:	5d                   	pop    %ebp
 4c4:	c3                   	ret    
 4c5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004d0 <stat>:

int stat(const char *n, struct stat *st)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	56                   	push   %esi
 4d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4d5:	83 ec 08             	sub    $0x8,%esp
 4d8:	6a 00                	push   $0x0
 4da:	ff 75 08             	pushl  0x8(%ebp)
 4dd:	e8 f2 01 00 00       	call   6d4 <open>
  if (fd < 0)
 4e2:	83 c4 10             	add    $0x10,%esp
 4e5:	85 c0                	test   %eax,%eax
 4e7:	78 27                	js     510 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4e9:	83 ec 08             	sub    $0x8,%esp
 4ec:	ff 75 0c             	pushl  0xc(%ebp)
 4ef:	89 c3                	mov    %eax,%ebx
 4f1:	50                   	push   %eax
 4f2:	e8 f5 01 00 00       	call   6ec <fstat>
  close(fd);
 4f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4fa:	89 c6                	mov    %eax,%esi
  close(fd);
 4fc:	e8 bb 01 00 00       	call   6bc <close>
  return r;
 501:	83 c4 10             	add    $0x10,%esp
}
 504:	8d 65 f8             	lea    -0x8(%ebp),%esp
 507:	89 f0                	mov    %esi,%eax
 509:	5b                   	pop    %ebx
 50a:	5e                   	pop    %esi
 50b:	5d                   	pop    %ebp
 50c:	c3                   	ret    
 50d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 510:	be ff ff ff ff       	mov    $0xffffffff,%esi
 515:	eb ed                	jmp    504 <stat+0x34>
 517:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51e:	66 90                	xchg   %ax,%ax

00000520 <atoi>:

int atoi(const char *s)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	53                   	push   %ebx
 524:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while ('0' <= *s && *s <= '9')
 527:	0f be 02             	movsbl (%edx),%eax
 52a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 52d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 530:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 535:	77 1e                	ja     555 <atoi+0x35>
 537:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53e:	66 90                	xchg   %ax,%ax
    n = n * 10 + *s++ - '0';
 540:	83 c2 01             	add    $0x1,%edx
 543:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 546:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 54a:	0f be 02             	movsbl (%edx),%eax
 54d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 550:	80 fb 09             	cmp    $0x9,%bl
 553:	76 eb                	jbe    540 <atoi+0x20>
  return n;
}
 555:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 558:	89 c8                	mov    %ecx,%eax
 55a:	c9                   	leave  
 55b:	c3                   	ret    
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000560 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	8b 45 10             	mov    0x10(%ebp),%eax
 567:	8b 55 08             	mov    0x8(%ebp),%edx
 56a:	56                   	push   %esi
 56b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while (n-- > 0)
 56e:	85 c0                	test   %eax,%eax
 570:	7e 13                	jle    585 <memmove+0x25>
 572:	01 d0                	add    %edx,%eax
  dst = vdst;
 574:	89 d7                	mov    %edx,%edi
 576:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 580:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 581:	39 f8                	cmp    %edi,%eax
 583:	75 fb                	jne    580 <memmove+0x20>
  return vdst;
}
 585:	5e                   	pop    %esi
 586:	89 d0                	mov    %edx,%eax
 588:	5f                   	pop    %edi
 589:	5d                   	pop    %ebp
 58a:	c3                   	ret    
 58b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 58f:	90                   	nop

00000590 <new_lock>:

// new
void new_lock(my_lock *l)
{
  ;
}
 590:	c3                   	ret    
 591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 598:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop

000005a0 <lock>:
 5a0:	c3                   	ret    
 5a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop

000005b0 <unlock>:
 5b0:	c3                   	ret    
 5b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bf:	90                   	nop

000005c0 <thread_create>:
{
  ;
}

int thread_create(void (*fn)(void *), void *arg)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	83 ec 14             	sub    $0x14,%esp
  void *thread_stack_pointer = malloc(PGSIZE * 2);
 5c6:	68 00 20 00 00       	push   $0x2000
 5cb:	e8 90 04 00 00       	call   a60 <malloc>

  if (thread_stack_pointer == 0)
 5d0:	83 c4 10             	add    $0x10,%esp
 5d3:	85 c0                	test   %eax,%eax
 5d5:	74 25                	je     5fc <thread_create+0x3c>
    return -1;

  // Check allocated stack is complete
  if ((uint)thread_stack_pointer % PGSIZE) // if not complete then add more
 5d7:	89 c2                	mov    %eax,%edx
 5d9:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 5df:	74 07                	je     5e8 <thread_create+0x28>
    thread_stack_pointer = thread_stack_pointer + (PGSIZE - ((uint)thread_stack_pointer % PGSIZE));
 5e1:	29 d0                	sub    %edx,%eax
 5e3:	05 00 10 00 00       	add    $0x1000,%eax

  int thread_id = clone(fn, arg, thread_stack_pointer);
 5e8:	83 ec 04             	sub    $0x4,%esp
 5eb:	50                   	push   %eax
 5ec:	ff 75 0c             	pushl  0xc(%ebp)
 5ef:	ff 75 08             	pushl  0x8(%ebp)
 5f2:	e8 3d 01 00 00       	call   734 <clone>
  return thread_id;
 5f7:	83 c4 10             	add    $0x10,%esp
}
 5fa:	c9                   	leave  
 5fb:	c3                   	ret    
 5fc:	c9                   	leave  
    return -1;
 5fd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 602:	c3                   	ret    
 603:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000610 <thread_join>:

int thread_join()
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	57                   	push   %edi
 614:	56                   	push   %esi
  void* stack;
  int ret = join(&stack);
 615:	8d 45 e4             	lea    -0x1c(%ebp),%eax
{
 618:	53                   	push   %ebx
 619:	83 ec 28             	sub    $0x28,%esp
  int ret = join(&stack);
 61c:	50                   	push   %eax
 61d:	e8 1a 01 00 00       	call   73c <join>
  // Checking if all the children are zombie
  for(int i = 0; i < 64; i++){
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 622:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 625:	83 c4 10             	add    $0x10,%esp
  for(int i = 0; i < 64; i++){
 628:	31 d2                	xor    %edx,%edx
  int ret = join(&stack);
 62a:	89 c3                	mov    %eax,%ebx
  for(int i = 0; i < 64; i++){
 62c:	b8 a0 0f 00 00       	mov    $0xfa0,%eax
 631:	eb 10                	jmp    643 <thread_join+0x33>
 633:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 637:	90                   	nop
 638:	83 c2 01             	add    $0x1,%edx
 63b:	83 c0 0c             	add    $0xc,%eax
 63e:	83 fa 40             	cmp    $0x40,%edx
 641:	74 3f                	je     682 <thread_join+0x72>
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 643:	83 38 01             	cmpl   $0x1,(%eax)
 646:	75 f0                	jne    638 <thread_join+0x28>
 648:	39 48 08             	cmp    %ecx,0x8(%eax)
 64b:	75 eb                	jne    638 <thread_join+0x28>
      free(ptrs[i].ptr);
 64d:	8d 34 52             	lea    (%edx,%edx,2),%esi
 650:	83 ec 0c             	sub    $0xc,%esp
 653:	c1 e6 02             	shl    $0x2,%esi
 656:	ff b6 a4 0f 00 00    	pushl  0xfa4(%esi)
 65c:	e8 6f 03 00 00       	call   9d0 <free>
      ptrs[i].stack = NULL;
      ptrs[i].busy = 0;
      ptrs[i].ptr = NULL;
      break;
 661:	83 c4 10             	add    $0x10,%esp
      ptrs[i].stack = NULL;
 664:	c7 86 a8 0f 00 00 00 	movl   $0x0,0xfa8(%esi)
 66b:	00 00 00 
      ptrs[i].busy = 0;
 66e:	c7 86 a0 0f 00 00 00 	movl   $0x0,0xfa0(%esi)
 675:	00 00 00 
      ptrs[i].ptr = NULL;
 678:	c7 86 a4 0f 00 00 00 	movl   $0x0,0xfa4(%esi)
 67f:	00 00 00 
    }
  }
  return ret;
}
 682:	8d 65 f4             	lea    -0xc(%ebp),%esp
 685:	89 d8                	mov    %ebx,%eax
 687:	5b                   	pop    %ebx
 688:	5e                   	pop    %esi
 689:	5f                   	pop    %edi
 68a:	5d                   	pop    %ebp
 68b:	c3                   	ret    

0000068c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 68c:	b8 01 00 00 00       	mov    $0x1,%eax
 691:	cd 40                	int    $0x40
 693:	c3                   	ret    

00000694 <exit>:
SYSCALL(exit)
 694:	b8 02 00 00 00       	mov    $0x2,%eax
 699:	cd 40                	int    $0x40
 69b:	c3                   	ret    

0000069c <wait>:
SYSCALL(wait)
 69c:	b8 03 00 00 00       	mov    $0x3,%eax
 6a1:	cd 40                	int    $0x40
 6a3:	c3                   	ret    

000006a4 <pipe>:
SYSCALL(pipe)
 6a4:	b8 04 00 00 00       	mov    $0x4,%eax
 6a9:	cd 40                	int    $0x40
 6ab:	c3                   	ret    

000006ac <read>:
SYSCALL(read)
 6ac:	b8 05 00 00 00       	mov    $0x5,%eax
 6b1:	cd 40                	int    $0x40
 6b3:	c3                   	ret    

000006b4 <write>:
SYSCALL(write)
 6b4:	b8 10 00 00 00       	mov    $0x10,%eax
 6b9:	cd 40                	int    $0x40
 6bb:	c3                   	ret    

000006bc <close>:
SYSCALL(close)
 6bc:	b8 15 00 00 00       	mov    $0x15,%eax
 6c1:	cd 40                	int    $0x40
 6c3:	c3                   	ret    

000006c4 <kill>:
SYSCALL(kill)
 6c4:	b8 06 00 00 00       	mov    $0x6,%eax
 6c9:	cd 40                	int    $0x40
 6cb:	c3                   	ret    

000006cc <exec>:
SYSCALL(exec)
 6cc:	b8 07 00 00 00       	mov    $0x7,%eax
 6d1:	cd 40                	int    $0x40
 6d3:	c3                   	ret    

000006d4 <open>:
SYSCALL(open)
 6d4:	b8 0f 00 00 00       	mov    $0xf,%eax
 6d9:	cd 40                	int    $0x40
 6db:	c3                   	ret    

000006dc <mknod>:
SYSCALL(mknod)
 6dc:	b8 11 00 00 00       	mov    $0x11,%eax
 6e1:	cd 40                	int    $0x40
 6e3:	c3                   	ret    

000006e4 <unlink>:
SYSCALL(unlink)
 6e4:	b8 12 00 00 00       	mov    $0x12,%eax
 6e9:	cd 40                	int    $0x40
 6eb:	c3                   	ret    

000006ec <fstat>:
SYSCALL(fstat)
 6ec:	b8 08 00 00 00       	mov    $0x8,%eax
 6f1:	cd 40                	int    $0x40
 6f3:	c3                   	ret    

000006f4 <link>:
SYSCALL(link)
 6f4:	b8 13 00 00 00       	mov    $0x13,%eax
 6f9:	cd 40                	int    $0x40
 6fb:	c3                   	ret    

000006fc <mkdir>:
SYSCALL(mkdir)
 6fc:	b8 14 00 00 00       	mov    $0x14,%eax
 701:	cd 40                	int    $0x40
 703:	c3                   	ret    

00000704 <chdir>:
SYSCALL(chdir)
 704:	b8 09 00 00 00       	mov    $0x9,%eax
 709:	cd 40                	int    $0x40
 70b:	c3                   	ret    

0000070c <dup>:
SYSCALL(dup)
 70c:	b8 0a 00 00 00       	mov    $0xa,%eax
 711:	cd 40                	int    $0x40
 713:	c3                   	ret    

00000714 <getpid>:
SYSCALL(getpid)
 714:	b8 0b 00 00 00       	mov    $0xb,%eax
 719:	cd 40                	int    $0x40
 71b:	c3                   	ret    

0000071c <sbrk>:
SYSCALL(sbrk)
 71c:	b8 0c 00 00 00       	mov    $0xc,%eax
 721:	cd 40                	int    $0x40
 723:	c3                   	ret    

00000724 <sleep>:
SYSCALL(sleep)
 724:	b8 0d 00 00 00       	mov    $0xd,%eax
 729:	cd 40                	int    $0x40
 72b:	c3                   	ret    

0000072c <uptime>:
SYSCALL(uptime)
 72c:	b8 0e 00 00 00       	mov    $0xe,%eax
 731:	cd 40                	int    $0x40
 733:	c3                   	ret    

00000734 <clone>:
// new
SYSCALL(clone)
 734:	b8 16 00 00 00       	mov    $0x16,%eax
 739:	cd 40                	int    $0x40
 73b:	c3                   	ret    

0000073c <join>:
SYSCALL(join)
 73c:	b8 17 00 00 00       	mov    $0x17,%eax
 741:	cd 40                	int    $0x40
 743:	c3                   	ret    
 744:	66 90                	xchg   %ax,%ax
 746:	66 90                	xchg   %ax,%ax
 748:	66 90                	xchg   %ax,%ax
 74a:	66 90                	xchg   %ax,%ax
 74c:	66 90                	xchg   %ax,%ax
 74e:	66 90                	xchg   %ax,%ax

00000750 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	57                   	push   %edi
 754:	56                   	push   %esi
 755:	53                   	push   %ebx
 756:	83 ec 3c             	sub    $0x3c,%esp
 759:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 75c:	89 d1                	mov    %edx,%ecx
{
 75e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 761:	85 d2                	test   %edx,%edx
 763:	0f 89 7f 00 00 00    	jns    7e8 <printint+0x98>
 769:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 76d:	74 79                	je     7e8 <printint+0x98>
    neg = 1;
 76f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 776:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 778:	31 db                	xor    %ebx,%ebx
 77a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 77d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 780:	89 c8                	mov    %ecx,%eax
 782:	31 d2                	xor    %edx,%edx
 784:	89 cf                	mov    %ecx,%edi
 786:	f7 75 c4             	divl   -0x3c(%ebp)
 789:	0f b6 92 bc 0b 00 00 	movzbl 0xbbc(%edx),%edx
 790:	89 45 c0             	mov    %eax,-0x40(%ebp)
 793:	89 d8                	mov    %ebx,%eax
 795:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 798:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 79b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 79e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 7a1:	76 dd                	jbe    780 <printint+0x30>
  if(neg)
 7a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 7a6:	85 c9                	test   %ecx,%ecx
 7a8:	74 0c                	je     7b6 <printint+0x66>
    buf[i++] = '-';
 7aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 7af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 7b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 7b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 7b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 7bd:	eb 07                	jmp    7c6 <printint+0x76>
 7bf:	90                   	nop
    putc(fd, buf[i]);
 7c0:	0f b6 13             	movzbl (%ebx),%edx
 7c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 7c6:	83 ec 04             	sub    $0x4,%esp
 7c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 7cc:	6a 01                	push   $0x1
 7ce:	56                   	push   %esi
 7cf:	57                   	push   %edi
 7d0:	e8 df fe ff ff       	call   6b4 <write>
  while(--i >= 0)
 7d5:	83 c4 10             	add    $0x10,%esp
 7d8:	39 de                	cmp    %ebx,%esi
 7da:	75 e4                	jne    7c0 <printint+0x70>
}
 7dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7df:	5b                   	pop    %ebx
 7e0:	5e                   	pop    %esi
 7e1:	5f                   	pop    %edi
 7e2:	5d                   	pop    %ebp
 7e3:	c3                   	ret    
 7e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 7e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 7ef:	eb 87                	jmp    778 <printint+0x28>
 7f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ff:	90                   	nop

00000800 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	57                   	push   %edi
 804:	56                   	push   %esi
 805:	53                   	push   %ebx
 806:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 809:	8b 75 0c             	mov    0xc(%ebp),%esi
 80c:	0f b6 1e             	movzbl (%esi),%ebx
 80f:	84 db                	test   %bl,%bl
 811:	0f 84 b8 00 00 00    	je     8cf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 817:	8d 45 10             	lea    0x10(%ebp),%eax
 81a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 81d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 820:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 822:	89 45 d0             	mov    %eax,-0x30(%ebp)
 825:	eb 37                	jmp    85e <printf+0x5e>
 827:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 82e:	66 90                	xchg   %ax,%ax
 830:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 833:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 838:	83 f8 25             	cmp    $0x25,%eax
 83b:	74 17                	je     854 <printf+0x54>
  write(fd, &c, 1);
 83d:	83 ec 04             	sub    $0x4,%esp
 840:	88 5d e7             	mov    %bl,-0x19(%ebp)
 843:	6a 01                	push   $0x1
 845:	57                   	push   %edi
 846:	ff 75 08             	pushl  0x8(%ebp)
 849:	e8 66 fe ff ff       	call   6b4 <write>
 84e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 851:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 854:	0f b6 1e             	movzbl (%esi),%ebx
 857:	83 c6 01             	add    $0x1,%esi
 85a:	84 db                	test   %bl,%bl
 85c:	74 71                	je     8cf <printf+0xcf>
    c = fmt[i] & 0xff;
 85e:	0f be cb             	movsbl %bl,%ecx
 861:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 864:	85 d2                	test   %edx,%edx
 866:	74 c8                	je     830 <printf+0x30>
      }
    } else if(state == '%'){
 868:	83 fa 25             	cmp    $0x25,%edx
 86b:	75 e7                	jne    854 <printf+0x54>
      if(c == 'd'){
 86d:	83 f8 64             	cmp    $0x64,%eax
 870:	0f 84 9a 00 00 00    	je     910 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 876:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 87c:	83 f9 70             	cmp    $0x70,%ecx
 87f:	74 5f                	je     8e0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 881:	83 f8 73             	cmp    $0x73,%eax
 884:	0f 84 d6 00 00 00    	je     960 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 88a:	83 f8 63             	cmp    $0x63,%eax
 88d:	0f 84 8d 00 00 00    	je     920 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 893:	83 f8 25             	cmp    $0x25,%eax
 896:	0f 84 b4 00 00 00    	je     950 <printf+0x150>
  write(fd, &c, 1);
 89c:	83 ec 04             	sub    $0x4,%esp
 89f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 8a3:	6a 01                	push   $0x1
 8a5:	57                   	push   %edi
 8a6:	ff 75 08             	pushl  0x8(%ebp)
 8a9:	e8 06 fe ff ff       	call   6b4 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 8ae:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 8b1:	83 c4 0c             	add    $0xc,%esp
 8b4:	6a 01                	push   $0x1
  for(i = 0; fmt[i]; i++){
 8b6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 8b9:	57                   	push   %edi
 8ba:	ff 75 08             	pushl  0x8(%ebp)
 8bd:	e8 f2 fd ff ff       	call   6b4 <write>
  for(i = 0; fmt[i]; i++){
 8c2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 8c6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 8c9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 8cb:	84 db                	test   %bl,%bl
 8cd:	75 8f                	jne    85e <printf+0x5e>
    }
  }
}
 8cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8d2:	5b                   	pop    %ebx
 8d3:	5e                   	pop    %esi
 8d4:	5f                   	pop    %edi
 8d5:	5d                   	pop    %ebp
 8d6:	c3                   	ret    
 8d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8de:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 8e0:	83 ec 0c             	sub    $0xc,%esp
 8e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 8e8:	6a 00                	push   $0x0
 8ea:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 8ed:	8b 45 08             	mov    0x8(%ebp),%eax
 8f0:	8b 13                	mov    (%ebx),%edx
 8f2:	e8 59 fe ff ff       	call   750 <printint>
        ap++;
 8f7:	89 d8                	mov    %ebx,%eax
 8f9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8fc:	31 d2                	xor    %edx,%edx
        ap++;
 8fe:	83 c0 04             	add    $0x4,%eax
 901:	89 45 d0             	mov    %eax,-0x30(%ebp)
 904:	e9 4b ff ff ff       	jmp    854 <printf+0x54>
 909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 910:	83 ec 0c             	sub    $0xc,%esp
 913:	b9 0a 00 00 00       	mov    $0xa,%ecx
 918:	6a 01                	push   $0x1
 91a:	eb ce                	jmp    8ea <printf+0xea>
 91c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 920:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 923:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 926:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 928:	6a 01                	push   $0x1
        ap++;
 92a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 92d:	57                   	push   %edi
 92e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 931:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 934:	e8 7b fd ff ff       	call   6b4 <write>
        ap++;
 939:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 93c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 93f:	31 d2                	xor    %edx,%edx
 941:	e9 0e ff ff ff       	jmp    854 <printf+0x54>
 946:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 94d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 950:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 953:	83 ec 04             	sub    $0x4,%esp
 956:	e9 59 ff ff ff       	jmp    8b4 <printf+0xb4>
 95b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 95f:	90                   	nop
        s = (char*)*ap;
 960:	8b 45 d0             	mov    -0x30(%ebp),%eax
 963:	8b 18                	mov    (%eax),%ebx
        ap++;
 965:	83 c0 04             	add    $0x4,%eax
 968:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 96b:	85 db                	test   %ebx,%ebx
 96d:	74 17                	je     986 <printf+0x186>
        while(*s != 0){
 96f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 972:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 974:	84 c0                	test   %al,%al
 976:	0f 84 d8 fe ff ff    	je     854 <printf+0x54>
 97c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 97f:	89 de                	mov    %ebx,%esi
 981:	8b 5d 08             	mov    0x8(%ebp),%ebx
 984:	eb 1a                	jmp    9a0 <printf+0x1a0>
          s = "(null)";
 986:	bb b2 0b 00 00       	mov    $0xbb2,%ebx
        while(*s != 0){
 98b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 98e:	b8 28 00 00 00       	mov    $0x28,%eax
 993:	89 de                	mov    %ebx,%esi
 995:	8b 5d 08             	mov    0x8(%ebp),%ebx
 998:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 99f:	90                   	nop
  write(fd, &c, 1);
 9a0:	83 ec 04             	sub    $0x4,%esp
          s++;
 9a3:	83 c6 01             	add    $0x1,%esi
 9a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 9a9:	6a 01                	push   $0x1
 9ab:	57                   	push   %edi
 9ac:	53                   	push   %ebx
 9ad:	e8 02 fd ff ff       	call   6b4 <write>
        while(*s != 0){
 9b2:	0f b6 06             	movzbl (%esi),%eax
 9b5:	83 c4 10             	add    $0x10,%esp
 9b8:	84 c0                	test   %al,%al
 9ba:	75 e4                	jne    9a0 <printf+0x1a0>
      state = 0;
 9bc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 9bf:	31 d2                	xor    %edx,%edx
 9c1:	e9 8e fe ff ff       	jmp    854 <printf+0x54>
 9c6:	66 90                	xchg   %ax,%ax
 9c8:	66 90                	xchg   %ax,%ax
 9ca:	66 90                	xchg   %ax,%ax
 9cc:	66 90                	xchg   %ax,%ax
 9ce:	66 90                	xchg   %ax,%ax

000009d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9d1:	a1 a0 12 00 00       	mov    0x12a0,%eax
{
 9d6:	89 e5                	mov    %esp,%ebp
 9d8:	57                   	push   %edi
 9d9:	56                   	push   %esi
 9da:	53                   	push   %ebx
 9db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 9de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9e8:	89 c2                	mov    %eax,%edx
 9ea:	8b 00                	mov    (%eax),%eax
 9ec:	39 ca                	cmp    %ecx,%edx
 9ee:	73 30                	jae    a20 <free+0x50>
 9f0:	39 c1                	cmp    %eax,%ecx
 9f2:	72 04                	jb     9f8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9f4:	39 c2                	cmp    %eax,%edx
 9f6:	72 f0                	jb     9e8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9fe:	39 f8                	cmp    %edi,%eax
 a00:	74 30                	je     a32 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 a02:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 a05:	8b 42 04             	mov    0x4(%edx),%eax
 a08:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a0b:	39 f1                	cmp    %esi,%ecx
 a0d:	74 3a                	je     a49 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a0f:	89 0a                	mov    %ecx,(%edx)
  freep = p;
}
 a11:	5b                   	pop    %ebx
  freep = p;
 a12:	89 15 a0 12 00 00    	mov    %edx,0x12a0
}
 a18:	5e                   	pop    %esi
 a19:	5f                   	pop    %edi
 a1a:	5d                   	pop    %ebp
 a1b:	c3                   	ret    
 a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a20:	39 c2                	cmp    %eax,%edx
 a22:	72 c4                	jb     9e8 <free+0x18>
 a24:	39 c1                	cmp    %eax,%ecx
 a26:	73 c0                	jae    9e8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 a28:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a2b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a2e:	39 f8                	cmp    %edi,%eax
 a30:	75 d0                	jne    a02 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 a32:	03 70 04             	add    0x4(%eax),%esi
 a35:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a38:	8b 02                	mov    (%edx),%eax
 a3a:	8b 00                	mov    (%eax),%eax
 a3c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 a3f:	8b 42 04             	mov    0x4(%edx),%eax
 a42:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a45:	39 f1                	cmp    %esi,%ecx
 a47:	75 c6                	jne    a0f <free+0x3f>
    p->s.size += bp->s.size;
 a49:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 a4c:	89 15 a0 12 00 00    	mov    %edx,0x12a0
    p->s.size += bp->s.size;
 a52:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 a55:	8b 43 f8             	mov    -0x8(%ebx),%eax
 a58:	89 02                	mov    %eax,(%edx)
}
 a5a:	5b                   	pop    %ebx
 a5b:	5e                   	pop    %esi
 a5c:	5f                   	pop    %edi
 a5d:	5d                   	pop    %ebp
 a5e:	c3                   	ret    
 a5f:	90                   	nop

00000a60 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a60:	55                   	push   %ebp
 a61:	89 e5                	mov    %esp,%ebp
 a63:	57                   	push   %edi
 a64:	56                   	push   %esi
 a65:	53                   	push   %ebx
 a66:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a69:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a6c:	8b 3d a0 12 00 00    	mov    0x12a0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a72:	8d 70 07             	lea    0x7(%eax),%esi
 a75:	c1 ee 03             	shr    $0x3,%esi
 a78:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a7b:	85 ff                	test   %edi,%edi
 a7d:	0f 84 ad 00 00 00    	je     b30 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a83:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 a85:	8b 48 04             	mov    0x4(%eax),%ecx
 a88:	39 f1                	cmp    %esi,%ecx
 a8a:	73 71                	jae    afd <malloc+0x9d>
 a8c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 a92:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a97:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a9a:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 aa1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 aa4:	eb 1b                	jmp    ac1 <malloc+0x61>
 aa6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 aad:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 ab2:	8b 4a 04             	mov    0x4(%edx),%ecx
 ab5:	39 f1                	cmp    %esi,%ecx
 ab7:	73 4f                	jae    b08 <malloc+0xa8>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ab9:	8b 3d a0 12 00 00    	mov    0x12a0,%edi
 abf:	89 d0                	mov    %edx,%eax
 ac1:	39 c7                	cmp    %eax,%edi
 ac3:	75 eb                	jne    ab0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 ac5:	83 ec 0c             	sub    $0xc,%esp
 ac8:	ff 75 e4             	pushl  -0x1c(%ebp)
 acb:	e8 4c fc ff ff       	call   71c <sbrk>
  if(p == (char*)-1)
 ad0:	83 c4 10             	add    $0x10,%esp
 ad3:	83 f8 ff             	cmp    $0xffffffff,%eax
 ad6:	74 1b                	je     af3 <malloc+0x93>
  hp->s.size = nu;
 ad8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 adb:	83 ec 0c             	sub    $0xc,%esp
 ade:	83 c0 08             	add    $0x8,%eax
 ae1:	50                   	push   %eax
 ae2:	e8 e9 fe ff ff       	call   9d0 <free>
  return freep;
 ae7:	a1 a0 12 00 00       	mov    0x12a0,%eax
      if((p = morecore(nunits)) == 0)
 aec:	83 c4 10             	add    $0x10,%esp
 aef:	85 c0                	test   %eax,%eax
 af1:	75 bd                	jne    ab0 <malloc+0x50>
        return 0;
  }
}
 af3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 af6:	31 c0                	xor    %eax,%eax
}
 af8:	5b                   	pop    %ebx
 af9:	5e                   	pop    %esi
 afa:	5f                   	pop    %edi
 afb:	5d                   	pop    %ebp
 afc:	c3                   	ret    
    if(p->s.size >= nunits){
 afd:	89 c2                	mov    %eax,%edx
 aff:	89 f8                	mov    %edi,%eax
 b01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 b08:	39 ce                	cmp    %ecx,%esi
 b0a:	74 54                	je     b60 <malloc+0x100>
        p->s.size -= nunits;
 b0c:	29 f1                	sub    %esi,%ecx
 b0e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 b11:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 b14:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 b17:	a3 a0 12 00 00       	mov    %eax,0x12a0
}
 b1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 b1f:	8d 42 08             	lea    0x8(%edx),%eax
}
 b22:	5b                   	pop    %ebx
 b23:	5e                   	pop    %esi
 b24:	5f                   	pop    %edi
 b25:	5d                   	pop    %ebp
 b26:	c3                   	ret    
 b27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b2e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 b30:	c7 05 a0 12 00 00 a4 	movl   $0x12a4,0x12a0
 b37:	12 00 00 
    base.s.size = 0;
 b3a:	bf a4 12 00 00       	mov    $0x12a4,%edi
    base.s.ptr = freep = prevp = &base;
 b3f:	c7 05 a4 12 00 00 a4 	movl   $0x12a4,0x12a4
 b46:	12 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b49:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 b4b:	c7 05 a8 12 00 00 00 	movl   $0x0,0x12a8
 b52:	00 00 00 
    if(p->s.size >= nunits){
 b55:	e9 32 ff ff ff       	jmp    a8c <malloc+0x2c>
 b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 b60:	8b 0a                	mov    (%edx),%ecx
 b62:	89 08                	mov    %ecx,(%eax)
 b64:	eb b1                	jmp    b17 <malloc+0xb7>
