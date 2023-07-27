
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
   f:	be 01 00 00 00       	mov    $0x1,%esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  21:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  24:	83 f8 01             	cmp    $0x1,%eax
  27:	7e 56                	jle    7f <main+0x7f>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 d8 04 00 00       	call   514 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	pushl  (%ebx)
  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
  4d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  50:	50                   	push   %eax
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 9e 04 00 00       	call   4fc <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 69 04 00 00       	call   4d4 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 cb 09 00 00       	push   $0x9cb
  73:	6a 01                	push   $0x1
  75:	e8 c6 05 00 00       	call   640 <printf>
      exit();
  7a:	e8 55 04 00 00       	call   4d4 <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 bd 09 00 00       	push   $0x9bd
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 42 04 00 00       	call   4d4 <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  a4:	56                   	push   %esi
  a5:	53                   	push   %ebx
  l = w = c = 0;
  a6:	31 db                	xor    %ebx,%ebx
{
  a8:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  b2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  b9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 60 0d 00 00       	push   $0xd60
  cd:	ff 75 08             	pushl  0x8(%ebp)
  d0:	e8 17 04 00 00       	call   4ec <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	89 c6                	mov    %eax,%esi
  da:	85 c0                	test   %eax,%eax
  dc:	7e 62                	jle    140 <wc+0xa0>
    for(i=0; i<n; i++){
  de:	31 ff                	xor    %edi,%edi
  e0:	eb 14                	jmp    f6 <wc+0x56>
  e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
  e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  ef:	83 c7 01             	add    $0x1,%edi
  f2:	39 fe                	cmp    %edi,%esi
  f4:	74 42                	je     138 <wc+0x98>
      if(buf[i] == '\n')
  f6:	0f be 87 60 0d 00 00 	movsbl 0xd60(%edi),%eax
        l++;
  fd:	31 c9                	xor    %ecx,%ecx
  ff:	3c 0a                	cmp    $0xa,%al
 101:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 104:	83 ec 08             	sub    $0x8,%esp
 107:	50                   	push   %eax
        l++;
 108:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 10a:	68 a8 09 00 00       	push   $0x9a8
 10f:	e8 3c 01 00 00       	call   250 <strchr>
 114:	83 c4 10             	add    $0x10,%esp
 117:	85 c0                	test   %eax,%eax
 119:	75 cd                	jne    e8 <wc+0x48>
      else if(!inword){
 11b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 11e:	85 d2                	test   %edx,%edx
 120:	75 cd                	jne    ef <wc+0x4f>
    for(i=0; i<n; i++){
 122:	83 c7 01             	add    $0x1,%edi
        w++;
 125:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 129:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 130:	39 fe                	cmp    %edi,%esi
 132:	75 c2                	jne    f6 <wc+0x56>
 134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      c++;
 138:	01 75 dc             	add    %esi,-0x24(%ebp)
 13b:	eb 83                	jmp    c0 <wc+0x20>
 13d:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 140:	75 24                	jne    166 <wc+0xc6>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 142:	83 ec 08             	sub    $0x8,%esp
 145:	ff 75 0c             	pushl  0xc(%ebp)
 148:	ff 75 dc             	pushl  -0x24(%ebp)
 14b:	ff 75 e0             	pushl  -0x20(%ebp)
 14e:	53                   	push   %ebx
 14f:	68 be 09 00 00       	push   $0x9be
 154:	6a 01                	push   $0x1
 156:	e8 e5 04 00 00       	call   640 <printf>
}
 15b:	83 c4 20             	add    $0x20,%esp
 15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 161:	5b                   	pop    %ebx
 162:	5e                   	pop    %esi
 163:	5f                   	pop    %edi
 164:	5d                   	pop    %ebp
 165:	c3                   	ret    
    printf(1, "wc: read error\n");
 166:	50                   	push   %eax
 167:	50                   	push   %eax
 168:	68 ae 09 00 00       	push   $0x9ae
 16d:	6a 01                	push   $0x1
 16f:	e8 cc 04 00 00       	call   640 <printf>
    exit();
 174:	e8 5b 03 00 00       	call   4d4 <exit>
 179:	66 90                	xchg   %ax,%ax
 17b:	66 90                	xchg   %ax,%ax
 17d:	66 90                	xchg   %ax,%ax
 17f:	90                   	nop

00000180 <strcpy>:

struct ptr_struct ptrs[64];

char *
strcpy(char *s, const char *t)
{
 180:	55                   	push   %ebp
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 181:	31 c0                	xor    %eax,%eax
{
 183:	89 e5                	mov    %esp,%ebp
 185:	53                   	push   %ebx
 186:	8b 4d 08             	mov    0x8(%ebp),%ecx
 189:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0)
 190:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 194:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 197:	83 c0 01             	add    $0x1,%eax
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strcpy+0x10>
    ;
  return os;
}
 19e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a1:	89 c8                	mov    %ecx,%eax
 1a3:	c9                   	leave  
 1a4:	c3                   	ret    
 1a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001b0 <strcmp>:

int strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1b7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 1ba:	0f b6 01             	movzbl (%ecx),%eax
 1bd:	0f b6 1a             	movzbl (%edx),%ebx
 1c0:	84 c0                	test   %al,%al
 1c2:	75 1d                	jne    1e1 <strcmp+0x31>
 1c4:	eb 2a                	jmp    1f0 <strcmp+0x40>
 1c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
 1d0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1d4:	83 c1 01             	add    $0x1,%ecx
 1d7:	83 c2 01             	add    $0x1,%edx
  return (uchar)*p - (uchar)*q;
 1da:	0f b6 1a             	movzbl (%edx),%ebx
  while (*p && *p == *q)
 1dd:	84 c0                	test   %al,%al
 1df:	74 0f                	je     1f0 <strcmp+0x40>
 1e1:	38 d8                	cmp    %bl,%al
 1e3:	74 eb                	je     1d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1e5:	29 d8                	sub    %ebx,%eax
}
 1e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1ea:	c9                   	leave  
 1eb:	c3                   	ret    
 1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1f2:	29 d8                	sub    %ebx,%eax
}
 1f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1f7:	c9                   	leave  
 1f8:	c3                   	ret    
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000200 <strlen>:

uint strlen(const char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for (n = 0; s[n]; n++)
 206:	80 3a 00             	cmpb   $0x0,(%edx)
 209:	74 15                	je     220 <strlen+0x20>
 20b:	31 c0                	xor    %eax,%eax
 20d:	8d 76 00             	lea    0x0(%esi),%esi
 210:	83 c0 01             	add    $0x1,%eax
 213:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 217:	89 c1                	mov    %eax,%ecx
 219:	75 f5                	jne    210 <strlen+0x10>
    ;
  return n;
}
 21b:	89 c8                	mov    %ecx,%eax
 21d:	5d                   	pop    %ebp
 21e:	c3                   	ret    
 21f:	90                   	nop
  for (n = 0; s[n]; n++)
 220:	31 c9                	xor    %ecx,%ecx
}
 222:	5d                   	pop    %ebp
 223:	89 c8                	mov    %ecx,%eax
 225:	c3                   	ret    
 226:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22d:	8d 76 00             	lea    0x0(%esi),%esi

00000230 <memset>:

void *
memset(void *dst, int c, uint n)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 237:	8b 4d 10             	mov    0x10(%ebp),%ecx
 23a:	8b 45 0c             	mov    0xc(%ebp),%eax
 23d:	89 d7                	mov    %edx,%edi
 23f:	fc                   	cld    
 240:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 242:	8b 7d fc             	mov    -0x4(%ebp),%edi
 245:	89 d0                	mov    %edx,%eax
 247:	c9                   	leave  
 248:	c3                   	ret    
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000250 <strchr>:

char *
strchr(const char *s, char c)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 45 08             	mov    0x8(%ebp),%eax
 256:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 25a:	0f b6 10             	movzbl (%eax),%edx
 25d:	84 d2                	test   %dl,%dl
 25f:	75 12                	jne    273 <strchr+0x23>
 261:	eb 1d                	jmp    280 <strchr+0x30>
 263:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 267:	90                   	nop
 268:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 26c:	83 c0 01             	add    $0x1,%eax
 26f:	84 d2                	test   %dl,%dl
 271:	74 0d                	je     280 <strchr+0x30>
    if (*s == c)
 273:	38 d1                	cmp    %dl,%cl
 275:	75 f1                	jne    268 <strchr+0x18>
      return (char *)s;
  return 0;
}
 277:	5d                   	pop    %ebp
 278:	c3                   	ret    
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 280:	31 c0                	xor    %eax,%eax
}
 282:	5d                   	pop    %ebp
 283:	c3                   	ret    
 284:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 28f:	90                   	nop

00000290 <gets>:

char *
gets(char *buf, int max)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	56                   	push   %esi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 295:	31 f6                	xor    %esi,%esi
{
 297:	53                   	push   %ebx
 298:	89 f3                	mov    %esi,%ebx
 29a:	83 ec 1c             	sub    $0x1c,%esp
 29d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for (i = 0; i + 1 < max;)
 2a0:	eb 2f                	jmp    2d1 <gets+0x41>
 2a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  {
    cc = read(0, &c, 1);
 2a8:	83 ec 04             	sub    $0x4,%esp
 2ab:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2ae:	6a 01                	push   $0x1
 2b0:	50                   	push   %eax
 2b1:	6a 00                	push   $0x0
 2b3:	e8 34 02 00 00       	call   4ec <read>
    if (cc < 1)
 2b8:	83 c4 10             	add    $0x10,%esp
 2bb:	85 c0                	test   %eax,%eax
 2bd:	7e 1c                	jle    2db <gets+0x4b>
      break;
    buf[i++] = c;
 2bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    if (c == '\n' || c == '\r')
 2c3:	83 c7 01             	add    $0x1,%edi
    buf[i++] = c;
 2c6:	88 47 ff             	mov    %al,-0x1(%edi)
    if (c == '\n' || c == '\r')
 2c9:	3c 0a                	cmp    $0xa,%al
 2cb:	74 23                	je     2f0 <gets+0x60>
 2cd:	3c 0d                	cmp    $0xd,%al
 2cf:	74 1f                	je     2f0 <gets+0x60>
  for (i = 0; i + 1 < max;)
 2d1:	83 c3 01             	add    $0x1,%ebx
    buf[i++] = c;
 2d4:	89 fe                	mov    %edi,%esi
  for (i = 0; i + 1 < max;)
 2d6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2d9:	7c cd                	jl     2a8 <gets+0x18>
 2db:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2dd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2e0:	c6 03 00             	movb   $0x0,(%ebx)
}
 2e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2e6:	5b                   	pop    %ebx
 2e7:	5e                   	pop    %esi
 2e8:	5f                   	pop    %edi
 2e9:	5d                   	pop    %ebp
 2ea:	c3                   	ret    
 2eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ef:	90                   	nop
  buf[i] = '\0';
 2f0:	8b 75 08             	mov    0x8(%ebp),%esi
}
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2f6:	01 de                	add    %ebx,%esi
 2f8:	89 f3                	mov    %esi,%ebx
 2fa:	c6 03 00             	movb   $0x0,(%ebx)
}
 2fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 300:	5b                   	pop    %ebx
 301:	5e                   	pop    %esi
 302:	5f                   	pop    %edi
 303:	5d                   	pop    %ebp
 304:	c3                   	ret    
 305:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <stat>:

int stat(const char *n, struct stat *st)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 315:	83 ec 08             	sub    $0x8,%esp
 318:	6a 00                	push   $0x0
 31a:	ff 75 08             	pushl  0x8(%ebp)
 31d:	e8 f2 01 00 00       	call   514 <open>
  if (fd < 0)
 322:	83 c4 10             	add    $0x10,%esp
 325:	85 c0                	test   %eax,%eax
 327:	78 27                	js     350 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 329:	83 ec 08             	sub    $0x8,%esp
 32c:	ff 75 0c             	pushl  0xc(%ebp)
 32f:	89 c3                	mov    %eax,%ebx
 331:	50                   	push   %eax
 332:	e8 f5 01 00 00       	call   52c <fstat>
  close(fd);
 337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 33a:	89 c6                	mov    %eax,%esi
  close(fd);
 33c:	e8 bb 01 00 00       	call   4fc <close>
  return r;
 341:	83 c4 10             	add    $0x10,%esp
}
 344:	8d 65 f8             	lea    -0x8(%ebp),%esp
 347:	89 f0                	mov    %esi,%eax
 349:	5b                   	pop    %ebx
 34a:	5e                   	pop    %esi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 350:	be ff ff ff ff       	mov    $0xffffffff,%esi
 355:	eb ed                	jmp    344 <stat+0x34>
 357:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35e:	66 90                	xchg   %ax,%ax

00000360 <atoi>:

int atoi(const char *s)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while ('0' <= *s && *s <= '9')
 367:	0f be 02             	movsbl (%edx),%eax
 36a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 36d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 370:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 375:	77 1e                	ja     395 <atoi+0x35>
 377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37e:	66 90                	xchg   %ax,%ax
    n = n * 10 + *s++ - '0';
 380:	83 c2 01             	add    $0x1,%edx
 383:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 386:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 38a:	0f be 02             	movsbl (%edx),%eax
 38d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 390:	80 fb 09             	cmp    $0x9,%bl
 393:	76 eb                	jbe    380 <atoi+0x20>
  return n;
}
 395:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 398:	89 c8                	mov    %ecx,%eax
 39a:	c9                   	leave  
 39b:	c3                   	ret    
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	8b 45 10             	mov    0x10(%ebp),%eax
 3a7:	8b 55 08             	mov    0x8(%ebp),%edx
 3aa:	56                   	push   %esi
 3ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while (n-- > 0)
 3ae:	85 c0                	test   %eax,%eax
 3b0:	7e 13                	jle    3c5 <memmove+0x25>
 3b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3b4:	89 d7                	mov    %edx,%edi
 3b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 3c1:	39 f8                	cmp    %edi,%eax
 3c3:	75 fb                	jne    3c0 <memmove+0x20>
  return vdst;
}
 3c5:	5e                   	pop    %esi
 3c6:	89 d0                	mov    %edx,%eax
 3c8:	5f                   	pop    %edi
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    
 3cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

000003d0 <new_lock>:

// new
void new_lock(my_lock *l)
{
  ;
}
 3d0:	c3                   	ret    
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop

000003e0 <lock>:
 3e0:	c3                   	ret    
 3e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop

000003f0 <unlock>:
 3f0:	c3                   	ret    
 3f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop

00000400 <thread_create>:
{
  ;
}

int thread_create(void (*fn)(void *), void *arg)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	83 ec 14             	sub    $0x14,%esp
  void *thread_stack_pointer = malloc(PGSIZE * 2);
 406:	68 00 20 00 00       	push   $0x2000
 40b:	e8 90 04 00 00       	call   8a0 <malloc>

  if (thread_stack_pointer == 0)
 410:	83 c4 10             	add    $0x10,%esp
 413:	85 c0                	test   %eax,%eax
 415:	74 25                	je     43c <thread_create+0x3c>
    return -1;

  // Check allocated stack is complete
  if ((uint)thread_stack_pointer % PGSIZE) // if not complete then add more
 417:	89 c2                	mov    %eax,%edx
 419:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 41f:	74 07                	je     428 <thread_create+0x28>
    thread_stack_pointer = thread_stack_pointer + (PGSIZE - ((uint)thread_stack_pointer % PGSIZE));
 421:	29 d0                	sub    %edx,%eax
 423:	05 00 10 00 00       	add    $0x1000,%eax

  int thread_id = clone(fn, arg, thread_stack_pointer);
 428:	83 ec 04             	sub    $0x4,%esp
 42b:	50                   	push   %eax
 42c:	ff 75 0c             	pushl  0xc(%ebp)
 42f:	ff 75 08             	pushl  0x8(%ebp)
 432:	e8 3d 01 00 00       	call   574 <clone>
  return thread_id;
 437:	83 c4 10             	add    $0x10,%esp
}
 43a:	c9                   	leave  
 43b:	c3                   	ret    
 43c:	c9                   	leave  
    return -1;
 43d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 442:	c3                   	ret    
 443:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000450 <thread_join>:

int thread_join()
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
  void* stack;
  int ret = join(&stack);
 455:	8d 45 e4             	lea    -0x1c(%ebp),%eax
{
 458:	53                   	push   %ebx
 459:	83 ec 28             	sub    $0x28,%esp
  int ret = join(&stack);
 45c:	50                   	push   %eax
 45d:	e8 1a 01 00 00       	call   57c <join>
  // Checking if all the children are zombie
  for(int i = 0; i < 64; i++){
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 462:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 465:	83 c4 10             	add    $0x10,%esp
  for(int i = 0; i < 64; i++){
 468:	31 d2                	xor    %edx,%edx
  int ret = join(&stack);
 46a:	89 c3                	mov    %eax,%ebx
  for(int i = 0; i < 64; i++){
 46c:	b8 60 0f 00 00       	mov    $0xf60,%eax
 471:	eb 10                	jmp    483 <thread_join+0x33>
 473:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 477:	90                   	nop
 478:	83 c2 01             	add    $0x1,%edx
 47b:	83 c0 0c             	add    $0xc,%eax
 47e:	83 fa 40             	cmp    $0x40,%edx
 481:	74 3f                	je     4c2 <thread_join+0x72>
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 483:	83 38 01             	cmpl   $0x1,(%eax)
 486:	75 f0                	jne    478 <thread_join+0x28>
 488:	39 48 08             	cmp    %ecx,0x8(%eax)
 48b:	75 eb                	jne    478 <thread_join+0x28>
      free(ptrs[i].ptr);
 48d:	8d 34 52             	lea    (%edx,%edx,2),%esi
 490:	83 ec 0c             	sub    $0xc,%esp
 493:	c1 e6 02             	shl    $0x2,%esi
 496:	ff b6 64 0f 00 00    	pushl  0xf64(%esi)
 49c:	e8 6f 03 00 00       	call   810 <free>
      ptrs[i].stack = NULL;
      ptrs[i].busy = 0;
      ptrs[i].ptr = NULL;
      break;
 4a1:	83 c4 10             	add    $0x10,%esp
      ptrs[i].stack = NULL;
 4a4:	c7 86 68 0f 00 00 00 	movl   $0x0,0xf68(%esi)
 4ab:	00 00 00 
      ptrs[i].busy = 0;
 4ae:	c7 86 60 0f 00 00 00 	movl   $0x0,0xf60(%esi)
 4b5:	00 00 00 
      ptrs[i].ptr = NULL;
 4b8:	c7 86 64 0f 00 00 00 	movl   $0x0,0xf64(%esi)
 4bf:	00 00 00 
    }
  }
  return ret;
}
 4c2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4c5:	89 d8                	mov    %ebx,%eax
 4c7:	5b                   	pop    %ebx
 4c8:	5e                   	pop    %esi
 4c9:	5f                   	pop    %edi
 4ca:	5d                   	pop    %ebp
 4cb:	c3                   	ret    

000004cc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4cc:	b8 01 00 00 00       	mov    $0x1,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <exit>:
SYSCALL(exit)
 4d4:	b8 02 00 00 00       	mov    $0x2,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <wait>:
SYSCALL(wait)
 4dc:	b8 03 00 00 00       	mov    $0x3,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <pipe>:
SYSCALL(pipe)
 4e4:	b8 04 00 00 00       	mov    $0x4,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <read>:
SYSCALL(read)
 4ec:	b8 05 00 00 00       	mov    $0x5,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <write>:
SYSCALL(write)
 4f4:	b8 10 00 00 00       	mov    $0x10,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <close>:
SYSCALL(close)
 4fc:	b8 15 00 00 00       	mov    $0x15,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <kill>:
SYSCALL(kill)
 504:	b8 06 00 00 00       	mov    $0x6,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <exec>:
SYSCALL(exec)
 50c:	b8 07 00 00 00       	mov    $0x7,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <open>:
SYSCALL(open)
 514:	b8 0f 00 00 00       	mov    $0xf,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <mknod>:
SYSCALL(mknod)
 51c:	b8 11 00 00 00       	mov    $0x11,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <unlink>:
SYSCALL(unlink)
 524:	b8 12 00 00 00       	mov    $0x12,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <fstat>:
SYSCALL(fstat)
 52c:	b8 08 00 00 00       	mov    $0x8,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <link>:
SYSCALL(link)
 534:	b8 13 00 00 00       	mov    $0x13,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <mkdir>:
SYSCALL(mkdir)
 53c:	b8 14 00 00 00       	mov    $0x14,%eax
 541:	cd 40                	int    $0x40
 543:	c3                   	ret    

00000544 <chdir>:
SYSCALL(chdir)
 544:	b8 09 00 00 00       	mov    $0x9,%eax
 549:	cd 40                	int    $0x40
 54b:	c3                   	ret    

0000054c <dup>:
SYSCALL(dup)
 54c:	b8 0a 00 00 00       	mov    $0xa,%eax
 551:	cd 40                	int    $0x40
 553:	c3                   	ret    

00000554 <getpid>:
SYSCALL(getpid)
 554:	b8 0b 00 00 00       	mov    $0xb,%eax
 559:	cd 40                	int    $0x40
 55b:	c3                   	ret    

0000055c <sbrk>:
SYSCALL(sbrk)
 55c:	b8 0c 00 00 00       	mov    $0xc,%eax
 561:	cd 40                	int    $0x40
 563:	c3                   	ret    

00000564 <sleep>:
SYSCALL(sleep)
 564:	b8 0d 00 00 00       	mov    $0xd,%eax
 569:	cd 40                	int    $0x40
 56b:	c3                   	ret    

0000056c <uptime>:
SYSCALL(uptime)
 56c:	b8 0e 00 00 00       	mov    $0xe,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <clone>:
// new
SYSCALL(clone)
 574:	b8 16 00 00 00       	mov    $0x16,%eax
 579:	cd 40                	int    $0x40
 57b:	c3                   	ret    

0000057c <join>:
SYSCALL(join)
 57c:	b8 17 00 00 00       	mov    $0x17,%eax
 581:	cd 40                	int    $0x40
 583:	c3                   	ret    
 584:	66 90                	xchg   %ax,%ax
 586:	66 90                	xchg   %ax,%ax
 588:	66 90                	xchg   %ax,%ax
 58a:	66 90                	xchg   %ax,%ax
 58c:	66 90                	xchg   %ax,%ax
 58e:	66 90                	xchg   %ax,%ax

00000590 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	56                   	push   %esi
 595:	53                   	push   %ebx
 596:	83 ec 3c             	sub    $0x3c,%esp
 599:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 59c:	89 d1                	mov    %edx,%ecx
{
 59e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5a1:	85 d2                	test   %edx,%edx
 5a3:	0f 89 7f 00 00 00    	jns    628 <printint+0x98>
 5a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5ad:	74 79                	je     628 <printint+0x98>
    neg = 1;
 5af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5b8:	31 db                	xor    %ebx,%ebx
 5ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5c0:	89 c8                	mov    %ecx,%eax
 5c2:	31 d2                	xor    %edx,%edx
 5c4:	89 cf                	mov    %ecx,%edi
 5c6:	f7 75 c4             	divl   -0x3c(%ebp)
 5c9:	0f b6 92 e8 09 00 00 	movzbl 0x9e8(%edx),%edx
 5d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5d3:	89 d8                	mov    %ebx,%eax
 5d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5e1:	76 dd                	jbe    5c0 <printint+0x30>
  if(neg)
 5e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5e6:	85 c9                	test   %ecx,%ecx
 5e8:	74 0c                	je     5f6 <printint+0x66>
    buf[i++] = '-';
 5ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5fd:	eb 07                	jmp    606 <printint+0x76>
 5ff:	90                   	nop
    putc(fd, buf[i]);
 600:	0f b6 13             	movzbl (%ebx),%edx
 603:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 606:	83 ec 04             	sub    $0x4,%esp
 609:	88 55 d7             	mov    %dl,-0x29(%ebp)
 60c:	6a 01                	push   $0x1
 60e:	56                   	push   %esi
 60f:	57                   	push   %edi
 610:	e8 df fe ff ff       	call   4f4 <write>
  while(--i >= 0)
 615:	83 c4 10             	add    $0x10,%esp
 618:	39 de                	cmp    %ebx,%esi
 61a:	75 e4                	jne    600 <printint+0x70>
}
 61c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 61f:	5b                   	pop    %ebx
 620:	5e                   	pop    %esi
 621:	5f                   	pop    %edi
 622:	5d                   	pop    %ebp
 623:	c3                   	ret    
 624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 628:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 62f:	eb 87                	jmp    5b8 <printint+0x28>
 631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 638:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63f:	90                   	nop

00000640 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	53                   	push   %ebx
 646:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 649:	8b 75 0c             	mov    0xc(%ebp),%esi
 64c:	0f b6 1e             	movzbl (%esi),%ebx
 64f:	84 db                	test   %bl,%bl
 651:	0f 84 b8 00 00 00    	je     70f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 657:	8d 45 10             	lea    0x10(%ebp),%eax
 65a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 65d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 660:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 662:	89 45 d0             	mov    %eax,-0x30(%ebp)
 665:	eb 37                	jmp    69e <printf+0x5e>
 667:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66e:	66 90                	xchg   %ax,%ax
 670:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 673:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 678:	83 f8 25             	cmp    $0x25,%eax
 67b:	74 17                	je     694 <printf+0x54>
  write(fd, &c, 1);
 67d:	83 ec 04             	sub    $0x4,%esp
 680:	88 5d e7             	mov    %bl,-0x19(%ebp)
 683:	6a 01                	push   $0x1
 685:	57                   	push   %edi
 686:	ff 75 08             	pushl  0x8(%ebp)
 689:	e8 66 fe ff ff       	call   4f4 <write>
 68e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 691:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 694:	0f b6 1e             	movzbl (%esi),%ebx
 697:	83 c6 01             	add    $0x1,%esi
 69a:	84 db                	test   %bl,%bl
 69c:	74 71                	je     70f <printf+0xcf>
    c = fmt[i] & 0xff;
 69e:	0f be cb             	movsbl %bl,%ecx
 6a1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6a4:	85 d2                	test   %edx,%edx
 6a6:	74 c8                	je     670 <printf+0x30>
      }
    } else if(state == '%'){
 6a8:	83 fa 25             	cmp    $0x25,%edx
 6ab:	75 e7                	jne    694 <printf+0x54>
      if(c == 'd'){
 6ad:	83 f8 64             	cmp    $0x64,%eax
 6b0:	0f 84 9a 00 00 00    	je     750 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6b6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6bc:	83 f9 70             	cmp    $0x70,%ecx
 6bf:	74 5f                	je     720 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6c1:	83 f8 73             	cmp    $0x73,%eax
 6c4:	0f 84 d6 00 00 00    	je     7a0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6ca:	83 f8 63             	cmp    $0x63,%eax
 6cd:	0f 84 8d 00 00 00    	je     760 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6d3:	83 f8 25             	cmp    $0x25,%eax
 6d6:	0f 84 b4 00 00 00    	je     790 <printf+0x150>
  write(fd, &c, 1);
 6dc:	83 ec 04             	sub    $0x4,%esp
 6df:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6e3:	6a 01                	push   $0x1
 6e5:	57                   	push   %edi
 6e6:	ff 75 08             	pushl  0x8(%ebp)
 6e9:	e8 06 fe ff ff       	call   4f4 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 6ee:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6f1:	83 c4 0c             	add    $0xc,%esp
 6f4:	6a 01                	push   $0x1
  for(i = 0; fmt[i]; i++){
 6f6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6f9:	57                   	push   %edi
 6fa:	ff 75 08             	pushl  0x8(%ebp)
 6fd:	e8 f2 fd ff ff       	call   4f4 <write>
  for(i = 0; fmt[i]; i++){
 702:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 706:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 709:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 70b:	84 db                	test   %bl,%bl
 70d:	75 8f                	jne    69e <printf+0x5e>
    }
  }
}
 70f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 712:	5b                   	pop    %ebx
 713:	5e                   	pop    %esi
 714:	5f                   	pop    %edi
 715:	5d                   	pop    %ebp
 716:	c3                   	ret    
 717:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 720:	83 ec 0c             	sub    $0xc,%esp
 723:	b9 10 00 00 00       	mov    $0x10,%ecx
 728:	6a 00                	push   $0x0
 72a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 72d:	8b 45 08             	mov    0x8(%ebp),%eax
 730:	8b 13                	mov    (%ebx),%edx
 732:	e8 59 fe ff ff       	call   590 <printint>
        ap++;
 737:	89 d8                	mov    %ebx,%eax
 739:	83 c4 10             	add    $0x10,%esp
      state = 0;
 73c:	31 d2                	xor    %edx,%edx
        ap++;
 73e:	83 c0 04             	add    $0x4,%eax
 741:	89 45 d0             	mov    %eax,-0x30(%ebp)
 744:	e9 4b ff ff ff       	jmp    694 <printf+0x54>
 749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 750:	83 ec 0c             	sub    $0xc,%esp
 753:	b9 0a 00 00 00       	mov    $0xa,%ecx
 758:	6a 01                	push   $0x1
 75a:	eb ce                	jmp    72a <printf+0xea>
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 760:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 763:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 766:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 768:	6a 01                	push   $0x1
        ap++;
 76a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 76d:	57                   	push   %edi
 76e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 771:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 774:	e8 7b fd ff ff       	call   4f4 <write>
        ap++;
 779:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 77c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 77f:	31 d2                	xor    %edx,%edx
 781:	e9 0e ff ff ff       	jmp    694 <printf+0x54>
 786:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 790:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 793:	83 ec 04             	sub    $0x4,%esp
 796:	e9 59 ff ff ff       	jmp    6f4 <printf+0xb4>
 79b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 79f:	90                   	nop
        s = (char*)*ap;
 7a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7a3:	8b 18                	mov    (%eax),%ebx
        ap++;
 7a5:	83 c0 04             	add    $0x4,%eax
 7a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7ab:	85 db                	test   %ebx,%ebx
 7ad:	74 17                	je     7c6 <printf+0x186>
        while(*s != 0){
 7af:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 7b2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 7b4:	84 c0                	test   %al,%al
 7b6:	0f 84 d8 fe ff ff    	je     694 <printf+0x54>
 7bc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7bf:	89 de                	mov    %ebx,%esi
 7c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7c4:	eb 1a                	jmp    7e0 <printf+0x1a0>
          s = "(null)";
 7c6:	bb df 09 00 00       	mov    $0x9df,%ebx
        while(*s != 0){
 7cb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7ce:	b8 28 00 00 00       	mov    $0x28,%eax
 7d3:	89 de                	mov    %ebx,%esi
 7d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7df:	90                   	nop
  write(fd, &c, 1);
 7e0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7e3:	83 c6 01             	add    $0x1,%esi
 7e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7e9:	6a 01                	push   $0x1
 7eb:	57                   	push   %edi
 7ec:	53                   	push   %ebx
 7ed:	e8 02 fd ff ff       	call   4f4 <write>
        while(*s != 0){
 7f2:	0f b6 06             	movzbl (%esi),%eax
 7f5:	83 c4 10             	add    $0x10,%esp
 7f8:	84 c0                	test   %al,%al
 7fa:	75 e4                	jne    7e0 <printf+0x1a0>
      state = 0;
 7fc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 7ff:	31 d2                	xor    %edx,%edx
 801:	e9 8e fe ff ff       	jmp    694 <printf+0x54>
 806:	66 90                	xchg   %ax,%ax
 808:	66 90                	xchg   %ax,%ax
 80a:	66 90                	xchg   %ax,%ax
 80c:	66 90                	xchg   %ax,%ax
 80e:	66 90                	xchg   %ax,%ax

00000810 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 810:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 811:	a1 60 12 00 00       	mov    0x1260,%eax
{
 816:	89 e5                	mov    %esp,%ebp
 818:	57                   	push   %edi
 819:	56                   	push   %esi
 81a:	53                   	push   %ebx
 81b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 81e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 828:	89 c2                	mov    %eax,%edx
 82a:	8b 00                	mov    (%eax),%eax
 82c:	39 ca                	cmp    %ecx,%edx
 82e:	73 30                	jae    860 <free+0x50>
 830:	39 c1                	cmp    %eax,%ecx
 832:	72 04                	jb     838 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 834:	39 c2                	cmp    %eax,%edx
 836:	72 f0                	jb     828 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 838:	8b 73 fc             	mov    -0x4(%ebx),%esi
 83b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 83e:	39 f8                	cmp    %edi,%eax
 840:	74 30                	je     872 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 842:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 845:	8b 42 04             	mov    0x4(%edx),%eax
 848:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 84b:	39 f1                	cmp    %esi,%ecx
 84d:	74 3a                	je     889 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 84f:	89 0a                	mov    %ecx,(%edx)
  freep = p;
}
 851:	5b                   	pop    %ebx
  freep = p;
 852:	89 15 60 12 00 00    	mov    %edx,0x1260
}
 858:	5e                   	pop    %esi
 859:	5f                   	pop    %edi
 85a:	5d                   	pop    %ebp
 85b:	c3                   	ret    
 85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 860:	39 c2                	cmp    %eax,%edx
 862:	72 c4                	jb     828 <free+0x18>
 864:	39 c1                	cmp    %eax,%ecx
 866:	73 c0                	jae    828 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 868:	8b 73 fc             	mov    -0x4(%ebx),%esi
 86b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 86e:	39 f8                	cmp    %edi,%eax
 870:	75 d0                	jne    842 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 872:	03 70 04             	add    0x4(%eax),%esi
 875:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 878:	8b 02                	mov    (%edx),%eax
 87a:	8b 00                	mov    (%eax),%eax
 87c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 87f:	8b 42 04             	mov    0x4(%edx),%eax
 882:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 885:	39 f1                	cmp    %esi,%ecx
 887:	75 c6                	jne    84f <free+0x3f>
    p->s.size += bp->s.size;
 889:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 88c:	89 15 60 12 00 00    	mov    %edx,0x1260
    p->s.size += bp->s.size;
 892:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 895:	8b 43 f8             	mov    -0x8(%ebx),%eax
 898:	89 02                	mov    %eax,(%edx)
}
 89a:	5b                   	pop    %ebx
 89b:	5e                   	pop    %esi
 89c:	5f                   	pop    %edi
 89d:	5d                   	pop    %ebp
 89e:	c3                   	ret    
 89f:	90                   	nop

000008a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	57                   	push   %edi
 8a4:	56                   	push   %esi
 8a5:	53                   	push   %ebx
 8a6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8ac:	8b 3d 60 12 00 00    	mov    0x1260,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b2:	8d 70 07             	lea    0x7(%eax),%esi
 8b5:	c1 ee 03             	shr    $0x3,%esi
 8b8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 8bb:	85 ff                	test   %edi,%edi
 8bd:	0f 84 ad 00 00 00    	je     970 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c3:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 8c5:	8b 48 04             	mov    0x4(%eax),%ecx
 8c8:	39 f1                	cmp    %esi,%ecx
 8ca:	73 71                	jae    93d <malloc+0x9d>
 8cc:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 8d2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8d7:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 8da:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 8e1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8e4:	eb 1b                	jmp    901 <malloc+0x61>
 8e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8ed:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 8f2:	8b 4a 04             	mov    0x4(%edx),%ecx
 8f5:	39 f1                	cmp    %esi,%ecx
 8f7:	73 4f                	jae    948 <malloc+0xa8>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8f9:	8b 3d 60 12 00 00    	mov    0x1260,%edi
 8ff:	89 d0                	mov    %edx,%eax
 901:	39 c7                	cmp    %eax,%edi
 903:	75 eb                	jne    8f0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 905:	83 ec 0c             	sub    $0xc,%esp
 908:	ff 75 e4             	pushl  -0x1c(%ebp)
 90b:	e8 4c fc ff ff       	call   55c <sbrk>
  if(p == (char*)-1)
 910:	83 c4 10             	add    $0x10,%esp
 913:	83 f8 ff             	cmp    $0xffffffff,%eax
 916:	74 1b                	je     933 <malloc+0x93>
  hp->s.size = nu;
 918:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 91b:	83 ec 0c             	sub    $0xc,%esp
 91e:	83 c0 08             	add    $0x8,%eax
 921:	50                   	push   %eax
 922:	e8 e9 fe ff ff       	call   810 <free>
  return freep;
 927:	a1 60 12 00 00       	mov    0x1260,%eax
      if((p = morecore(nunits)) == 0)
 92c:	83 c4 10             	add    $0x10,%esp
 92f:	85 c0                	test   %eax,%eax
 931:	75 bd                	jne    8f0 <malloc+0x50>
        return 0;
  }
}
 933:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 936:	31 c0                	xor    %eax,%eax
}
 938:	5b                   	pop    %ebx
 939:	5e                   	pop    %esi
 93a:	5f                   	pop    %edi
 93b:	5d                   	pop    %ebp
 93c:	c3                   	ret    
    if(p->s.size >= nunits){
 93d:	89 c2                	mov    %eax,%edx
 93f:	89 f8                	mov    %edi,%eax
 941:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 948:	39 ce                	cmp    %ecx,%esi
 94a:	74 54                	je     9a0 <malloc+0x100>
        p->s.size -= nunits;
 94c:	29 f1                	sub    %esi,%ecx
 94e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 951:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 954:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 957:	a3 60 12 00 00       	mov    %eax,0x1260
}
 95c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 95f:	8d 42 08             	lea    0x8(%edx),%eax
}
 962:	5b                   	pop    %ebx
 963:	5e                   	pop    %esi
 964:	5f                   	pop    %edi
 965:	5d                   	pop    %ebp
 966:	c3                   	ret    
 967:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 96e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 970:	c7 05 60 12 00 00 64 	movl   $0x1264,0x1260
 977:	12 00 00 
    base.s.size = 0;
 97a:	bf 64 12 00 00       	mov    $0x1264,%edi
    base.s.ptr = freep = prevp = &base;
 97f:	c7 05 64 12 00 00 64 	movl   $0x1264,0x1264
 986:	12 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 989:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 98b:	c7 05 68 12 00 00 00 	movl   $0x0,0x1268
 992:	00 00 00 
    if(p->s.size >= nunits){
 995:	e9 32 ff ff ff       	jmp    8cc <malloc+0x2c>
 99a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 9a0:	8b 0a                	mov    (%edx),%ecx
 9a2:	89 08                	mov    %ecx,(%eax)
 9a4:	eb b1                	jmp    957 <malloc+0xb7>
