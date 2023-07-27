
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 18 09 00 00       	push   $0x918
  19:	e8 66 04 00 00       	call   484 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 9f 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 89 04 00 00       	call   4bc <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 7d 04 00 00       	call   4bc <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	68 20 09 00 00       	push   $0x920
  50:	6a 01                	push   $0x1
  52:	e8 59 05 00 00       	call   5b0 <printf>
    pid = fork();
  57:	e8 e0 03 00 00       	call   43c <fork>
    if(pid < 0){
  5c:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  5f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  61:	85 c0                	test   %eax,%eax
  63:	78 2c                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  65:	74 3d                	je     a4 <main+0xa4>
  67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  6e:	66 90                	xchg   %ax,%ax
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 d7 03 00 00       	call   44c <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 cf                	js     48 <main+0x48>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 cb                	je     48 <main+0x48>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 5f 09 00 00       	push   $0x95f
  85:	6a 01                	push   $0x1
  87:	e8 24 05 00 00       	call   5b0 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 33 09 00 00       	push   $0x933
  98:	6a 01                	push   $0x1
  9a:	e8 11 05 00 00       	call   5b0 <printf>
      exit();
  9f:	e8 a0 03 00 00       	call   444 <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 a8 0c 00 00       	push   $0xca8
  ab:	68 46 09 00 00       	push   $0x946
  b0:	e8 c7 03 00 00       	call   47c <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 49 09 00 00       	push   $0x949
  bc:	6a 01                	push   $0x1
  be:	e8 ed 04 00 00       	call   5b0 <printf>
      exit();
  c3:	e8 7c 03 00 00       	call   444 <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 18 09 00 00       	push   $0x918
  d2:	e8 b5 03 00 00       	call   48c <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 18 09 00 00       	push   $0x918
  e0:	e8 9f 03 00 00       	call   484 <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 3c ff ff ff       	jmp    29 <main+0x29>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:

struct ptr_struct ptrs[64];

char *
strcpy(char *s, const char *t)
{
  f0:	55                   	push   %ebp
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
  f1:	31 c0                	xor    %eax,%eax
{
  f3:	89 e5                	mov    %esp,%ebp
  f5:	53                   	push   %ebx
  f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0)
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 10e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 111:	89 c8                	mov    %ecx,%eax
 113:	c9                   	leave  
 114:	c3                   	ret    
 115:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000120 <strcmp>:

int strcmp(const char *p, const char *q)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 4d 08             	mov    0x8(%ebp),%ecx
 127:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 12a:	0f b6 01             	movzbl (%ecx),%eax
 12d:	0f b6 1a             	movzbl (%edx),%ebx
 130:	84 c0                	test   %al,%al
 132:	75 1d                	jne    151 <strcmp+0x31>
 134:	eb 2a                	jmp    160 <strcmp+0x40>
 136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13d:	8d 76 00             	lea    0x0(%esi),%esi
 140:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 144:	83 c1 01             	add    $0x1,%ecx
 147:	83 c2 01             	add    $0x1,%edx
  return (uchar)*p - (uchar)*q;
 14a:	0f b6 1a             	movzbl (%edx),%ebx
  while (*p && *p == *q)
 14d:	84 c0                	test   %al,%al
 14f:	74 0f                	je     160 <strcmp+0x40>
 151:	38 d8                	cmp    %bl,%al
 153:	74 eb                	je     140 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 155:	29 d8                	sub    %ebx,%eax
}
 157:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 15a:	c9                   	leave  
 15b:	c3                   	ret    
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 160:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 162:	29 d8                	sub    %ebx,%eax
}
 164:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 167:	c9                   	leave  
 168:	c3                   	ret    
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000170 <strlen>:

uint strlen(const char *s)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for (n = 0; s[n]; n++)
 176:	80 3a 00             	cmpb   $0x0,(%edx)
 179:	74 15                	je     190 <strlen+0x20>
 17b:	31 c0                	xor    %eax,%eax
 17d:	8d 76 00             	lea    0x0(%esi),%esi
 180:	83 c0 01             	add    $0x1,%eax
 183:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 187:	89 c1                	mov    %eax,%ecx
 189:	75 f5                	jne    180 <strlen+0x10>
    ;
  return n;
}
 18b:	89 c8                	mov    %ecx,%eax
 18d:	5d                   	pop    %ebp
 18e:	c3                   	ret    
 18f:	90                   	nop
  for (n = 0; s[n]; n++)
 190:	31 c9                	xor    %ecx,%ecx
}
 192:	5d                   	pop    %ebp
 193:	89 c8                	mov    %ecx,%eax
 195:	c3                   	ret    
 196:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19d:	8d 76 00             	lea    0x0(%esi),%esi

000001a0 <memset>:

void *
memset(void *dst, int c, uint n)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ad:	89 d7                	mov    %edx,%edi
 1af:	fc                   	cld    
 1b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1b2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1b5:	89 d0                	mov    %edx,%eax
 1b7:	c9                   	leave  
 1b8:	c3                   	ret    
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001c0 <strchr>:

char *
strchr(const char *s, char c)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 45 08             	mov    0x8(%ebp),%eax
 1c6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 1ca:	0f b6 10             	movzbl (%eax),%edx
 1cd:	84 d2                	test   %dl,%dl
 1cf:	75 12                	jne    1e3 <strchr+0x23>
 1d1:	eb 1d                	jmp    1f0 <strchr+0x30>
 1d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1d7:	90                   	nop
 1d8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1dc:	83 c0 01             	add    $0x1,%eax
 1df:	84 d2                	test   %dl,%dl
 1e1:	74 0d                	je     1f0 <strchr+0x30>
    if (*s == c)
 1e3:	38 d1                	cmp    %dl,%cl
 1e5:	75 f1                	jne    1d8 <strchr+0x18>
      return (char *)s;
  return 0;
}
 1e7:	5d                   	pop    %ebp
 1e8:	c3                   	ret    
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1f0:	31 c0                	xor    %eax,%eax
}
 1f2:	5d                   	pop    %ebp
 1f3:	c3                   	ret    
 1f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1ff:	90                   	nop

00000200 <gets>:

char *
gets(char *buf, int max)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	56                   	push   %esi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 205:	31 f6                	xor    %esi,%esi
{
 207:	53                   	push   %ebx
 208:	89 f3                	mov    %esi,%ebx
 20a:	83 ec 1c             	sub    $0x1c,%esp
 20d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for (i = 0; i + 1 < max;)
 210:	eb 2f                	jmp    241 <gets+0x41>
 212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  {
    cc = read(0, &c, 1);
 218:	83 ec 04             	sub    $0x4,%esp
 21b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 21e:	6a 01                	push   $0x1
 220:	50                   	push   %eax
 221:	6a 00                	push   $0x0
 223:	e8 34 02 00 00       	call   45c <read>
    if (cc < 1)
 228:	83 c4 10             	add    $0x10,%esp
 22b:	85 c0                	test   %eax,%eax
 22d:	7e 1c                	jle    24b <gets+0x4b>
      break;
    buf[i++] = c;
 22f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    if (c == '\n' || c == '\r')
 233:	83 c7 01             	add    $0x1,%edi
    buf[i++] = c;
 236:	88 47 ff             	mov    %al,-0x1(%edi)
    if (c == '\n' || c == '\r')
 239:	3c 0a                	cmp    $0xa,%al
 23b:	74 23                	je     260 <gets+0x60>
 23d:	3c 0d                	cmp    $0xd,%al
 23f:	74 1f                	je     260 <gets+0x60>
  for (i = 0; i + 1 < max;)
 241:	83 c3 01             	add    $0x1,%ebx
    buf[i++] = c;
 244:	89 fe                	mov    %edi,%esi
  for (i = 0; i + 1 < max;)
 246:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 249:	7c cd                	jl     218 <gets+0x18>
 24b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 24d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 250:	c6 03 00             	movb   $0x0,(%ebx)
}
 253:	8d 65 f4             	lea    -0xc(%ebp),%esp
 256:	5b                   	pop    %ebx
 257:	5e                   	pop    %esi
 258:	5f                   	pop    %edi
 259:	5d                   	pop    %ebp
 25a:	c3                   	ret    
 25b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 25f:	90                   	nop
  buf[i] = '\0';
 260:	8b 75 08             	mov    0x8(%ebp),%esi
}
 263:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 266:	01 de                	add    %ebx,%esi
 268:	89 f3                	mov    %esi,%ebx
 26a:	c6 03 00             	movb   $0x0,(%ebx)
}
 26d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 270:	5b                   	pop    %ebx
 271:	5e                   	pop    %esi
 272:	5f                   	pop    %edi
 273:	5d                   	pop    %ebp
 274:	c3                   	ret    
 275:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000280 <stat>:

int stat(const char *n, struct stat *st)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 285:	83 ec 08             	sub    $0x8,%esp
 288:	6a 00                	push   $0x0
 28a:	ff 75 08             	pushl  0x8(%ebp)
 28d:	e8 f2 01 00 00       	call   484 <open>
  if (fd < 0)
 292:	83 c4 10             	add    $0x10,%esp
 295:	85 c0                	test   %eax,%eax
 297:	78 27                	js     2c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	ff 75 0c             	pushl  0xc(%ebp)
 29f:	89 c3                	mov    %eax,%ebx
 2a1:	50                   	push   %eax
 2a2:	e8 f5 01 00 00       	call   49c <fstat>
  close(fd);
 2a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2aa:	89 c6                	mov    %eax,%esi
  close(fd);
 2ac:	e8 bb 01 00 00       	call   46c <close>
  return r;
 2b1:	83 c4 10             	add    $0x10,%esp
}
 2b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2b7:	89 f0                	mov    %esi,%eax
 2b9:	5b                   	pop    %ebx
 2ba:	5e                   	pop    %esi
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2c5:	eb ed                	jmp    2b4 <stat+0x34>
 2c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ce:	66 90                	xchg   %ax,%ax

000002d0 <atoi>:

int atoi(const char *s)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	53                   	push   %ebx
 2d4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while ('0' <= *s && *s <= '9')
 2d7:	0f be 02             	movsbl (%edx),%eax
 2da:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2dd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2e0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 2e5:	77 1e                	ja     305 <atoi+0x35>
 2e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ee:	66 90                	xchg   %ax,%ax
    n = n * 10 + *s++ - '0';
 2f0:	83 c2 01             	add    $0x1,%edx
 2f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 2fa:	0f be 02             	movsbl (%edx),%eax
 2fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 300:	80 fb 09             	cmp    $0x9,%bl
 303:	76 eb                	jbe    2f0 <atoi+0x20>
  return n;
}
 305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 308:	89 c8                	mov    %ecx,%eax
 30a:	c9                   	leave  
 30b:	c3                   	ret    
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	8b 45 10             	mov    0x10(%ebp),%eax
 317:	8b 55 08             	mov    0x8(%ebp),%edx
 31a:	56                   	push   %esi
 31b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while (n-- > 0)
 31e:	85 c0                	test   %eax,%eax
 320:	7e 13                	jle    335 <memmove+0x25>
 322:	01 d0                	add    %edx,%eax
  dst = vdst;
 324:	89 d7                	mov    %edx,%edi
 326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 330:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 331:	39 f8                	cmp    %edi,%eax
 333:	75 fb                	jne    330 <memmove+0x20>
  return vdst;
}
 335:	5e                   	pop    %esi
 336:	89 d0                	mov    %edx,%eax
 338:	5f                   	pop    %edi
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    
 33b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 33f:	90                   	nop

00000340 <new_lock>:

// new
void new_lock(my_lock *l)
{
  ;
}
 340:	c3                   	ret    
 341:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 348:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <lock>:
 350:	c3                   	ret    
 351:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 358:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop

00000360 <unlock>:
 360:	c3                   	ret    
 361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 368:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <thread_create>:
{
  ;
}

int thread_create(void (*fn)(void *), void *arg)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	83 ec 14             	sub    $0x14,%esp
  void *thread_stack_pointer = malloc(PGSIZE * 2);
 376:	68 00 20 00 00       	push   $0x2000
 37b:	e8 90 04 00 00       	call   810 <malloc>

  if (thread_stack_pointer == 0)
 380:	83 c4 10             	add    $0x10,%esp
 383:	85 c0                	test   %eax,%eax
 385:	74 25                	je     3ac <thread_create+0x3c>
    return -1;

  // Check allocated stack is complete
  if ((uint)thread_stack_pointer % PGSIZE) // if not complete then add more
 387:	89 c2                	mov    %eax,%edx
 389:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 38f:	74 07                	je     398 <thread_create+0x28>
    thread_stack_pointer = thread_stack_pointer + (PGSIZE - ((uint)thread_stack_pointer % PGSIZE));
 391:	29 d0                	sub    %edx,%eax
 393:	05 00 10 00 00       	add    $0x1000,%eax

  int thread_id = clone(fn, arg, thread_stack_pointer);
 398:	83 ec 04             	sub    $0x4,%esp
 39b:	50                   	push   %eax
 39c:	ff 75 0c             	pushl  0xc(%ebp)
 39f:	ff 75 08             	pushl  0x8(%ebp)
 3a2:	e8 3d 01 00 00       	call   4e4 <clone>
  return thread_id;
 3a7:	83 c4 10             	add    $0x10,%esp
}
 3aa:	c9                   	leave  
 3ab:	c3                   	ret    
 3ac:	c9                   	leave  
    return -1;
 3ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 3b2:	c3                   	ret    
 3b3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003c0 <thread_join>:

int thread_join()
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
  void* stack;
  int ret = join(&stack);
 3c5:	8d 45 e4             	lea    -0x1c(%ebp),%eax
{
 3c8:	53                   	push   %ebx
 3c9:	83 ec 28             	sub    $0x28,%esp
  int ret = join(&stack);
 3cc:	50                   	push   %eax
 3cd:	e8 1a 01 00 00       	call   4ec <join>
  // Checking if all the children are zombie
  for(int i = 0; i < 64; i++){
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 3d2:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 3d5:	83 c4 10             	add    $0x10,%esp
  for(int i = 0; i < 64; i++){
 3d8:	31 d2                	xor    %edx,%edx
  int ret = join(&stack);
 3da:	89 c3                	mov    %eax,%ebx
  for(int i = 0; i < 64; i++){
 3dc:	b8 c0 0c 00 00       	mov    $0xcc0,%eax
 3e1:	eb 10                	jmp    3f3 <thread_join+0x33>
 3e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3e7:	90                   	nop
 3e8:	83 c2 01             	add    $0x1,%edx
 3eb:	83 c0 0c             	add    $0xc,%eax
 3ee:	83 fa 40             	cmp    $0x40,%edx
 3f1:	74 3f                	je     432 <thread_join+0x72>
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
 3f3:	83 38 01             	cmpl   $0x1,(%eax)
 3f6:	75 f0                	jne    3e8 <thread_join+0x28>
 3f8:	39 48 08             	cmp    %ecx,0x8(%eax)
 3fb:	75 eb                	jne    3e8 <thread_join+0x28>
      free(ptrs[i].ptr);
 3fd:	8d 34 52             	lea    (%edx,%edx,2),%esi
 400:	83 ec 0c             	sub    $0xc,%esp
 403:	c1 e6 02             	shl    $0x2,%esi
 406:	ff b6 c4 0c 00 00    	pushl  0xcc4(%esi)
 40c:	e8 6f 03 00 00       	call   780 <free>
      ptrs[i].stack = NULL;
      ptrs[i].busy = 0;
      ptrs[i].ptr = NULL;
      break;
 411:	83 c4 10             	add    $0x10,%esp
      ptrs[i].stack = NULL;
 414:	c7 86 c8 0c 00 00 00 	movl   $0x0,0xcc8(%esi)
 41b:	00 00 00 
      ptrs[i].busy = 0;
 41e:	c7 86 c0 0c 00 00 00 	movl   $0x0,0xcc0(%esi)
 425:	00 00 00 
      ptrs[i].ptr = NULL;
 428:	c7 86 c4 0c 00 00 00 	movl   $0x0,0xcc4(%esi)
 42f:	00 00 00 
    }
  }
  return ret;
}
 432:	8d 65 f4             	lea    -0xc(%ebp),%esp
 435:	89 d8                	mov    %ebx,%eax
 437:	5b                   	pop    %ebx
 438:	5e                   	pop    %esi
 439:	5f                   	pop    %edi
 43a:	5d                   	pop    %ebp
 43b:	c3                   	ret    

0000043c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 43c:	b8 01 00 00 00       	mov    $0x1,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <exit>:
SYSCALL(exit)
 444:	b8 02 00 00 00       	mov    $0x2,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <wait>:
SYSCALL(wait)
 44c:	b8 03 00 00 00       	mov    $0x3,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <pipe>:
SYSCALL(pipe)
 454:	b8 04 00 00 00       	mov    $0x4,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <read>:
SYSCALL(read)
 45c:	b8 05 00 00 00       	mov    $0x5,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <write>:
SYSCALL(write)
 464:	b8 10 00 00 00       	mov    $0x10,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <close>:
SYSCALL(close)
 46c:	b8 15 00 00 00       	mov    $0x15,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <kill>:
SYSCALL(kill)
 474:	b8 06 00 00 00       	mov    $0x6,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <exec>:
SYSCALL(exec)
 47c:	b8 07 00 00 00       	mov    $0x7,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <open>:
SYSCALL(open)
 484:	b8 0f 00 00 00       	mov    $0xf,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <mknod>:
SYSCALL(mknod)
 48c:	b8 11 00 00 00       	mov    $0x11,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <unlink>:
SYSCALL(unlink)
 494:	b8 12 00 00 00       	mov    $0x12,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <fstat>:
SYSCALL(fstat)
 49c:	b8 08 00 00 00       	mov    $0x8,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <link>:
SYSCALL(link)
 4a4:	b8 13 00 00 00       	mov    $0x13,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <mkdir>:
SYSCALL(mkdir)
 4ac:	b8 14 00 00 00       	mov    $0x14,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <chdir>:
SYSCALL(chdir)
 4b4:	b8 09 00 00 00       	mov    $0x9,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <dup>:
SYSCALL(dup)
 4bc:	b8 0a 00 00 00       	mov    $0xa,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <getpid>:
SYSCALL(getpid)
 4c4:	b8 0b 00 00 00       	mov    $0xb,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <sbrk>:
SYSCALL(sbrk)
 4cc:	b8 0c 00 00 00       	mov    $0xc,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <sleep>:
SYSCALL(sleep)
 4d4:	b8 0d 00 00 00       	mov    $0xd,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <uptime>:
SYSCALL(uptime)
 4dc:	b8 0e 00 00 00       	mov    $0xe,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <clone>:
// new
SYSCALL(clone)
 4e4:	b8 16 00 00 00       	mov    $0x16,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <join>:
SYSCALL(join)
 4ec:	b8 17 00 00 00       	mov    $0x17,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    
 4f4:	66 90                	xchg   %ax,%ax
 4f6:	66 90                	xchg   %ax,%ax
 4f8:	66 90                	xchg   %ax,%ax
 4fa:	66 90                	xchg   %ax,%ax
 4fc:	66 90                	xchg   %ax,%ax
 4fe:	66 90                	xchg   %ax,%ax

00000500 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	83 ec 3c             	sub    $0x3c,%esp
 509:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 50c:	89 d1                	mov    %edx,%ecx
{
 50e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 511:	85 d2                	test   %edx,%edx
 513:	0f 89 7f 00 00 00    	jns    598 <printint+0x98>
 519:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 51d:	74 79                	je     598 <printint+0x98>
    neg = 1;
 51f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 526:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 528:	31 db                	xor    %ebx,%ebx
 52a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 52d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 530:	89 c8                	mov    %ecx,%eax
 532:	31 d2                	xor    %edx,%edx
 534:	89 cf                	mov    %ecx,%edi
 536:	f7 75 c4             	divl   -0x3c(%ebp)
 539:	0f b6 92 70 09 00 00 	movzbl 0x970(%edx),%edx
 540:	89 45 c0             	mov    %eax,-0x40(%ebp)
 543:	89 d8                	mov    %ebx,%eax
 545:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 548:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 54b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 54e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 551:	76 dd                	jbe    530 <printint+0x30>
  if(neg)
 553:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 556:	85 c9                	test   %ecx,%ecx
 558:	74 0c                	je     566 <printint+0x66>
    buf[i++] = '-';
 55a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 55f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 561:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 566:	8b 7d b8             	mov    -0x48(%ebp),%edi
 569:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 56d:	eb 07                	jmp    576 <printint+0x76>
 56f:	90                   	nop
    putc(fd, buf[i]);
 570:	0f b6 13             	movzbl (%ebx),%edx
 573:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 576:	83 ec 04             	sub    $0x4,%esp
 579:	88 55 d7             	mov    %dl,-0x29(%ebp)
 57c:	6a 01                	push   $0x1
 57e:	56                   	push   %esi
 57f:	57                   	push   %edi
 580:	e8 df fe ff ff       	call   464 <write>
  while(--i >= 0)
 585:	83 c4 10             	add    $0x10,%esp
 588:	39 de                	cmp    %ebx,%esi
 58a:	75 e4                	jne    570 <printint+0x70>
}
 58c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 58f:	5b                   	pop    %ebx
 590:	5e                   	pop    %esi
 591:	5f                   	pop    %edi
 592:	5d                   	pop    %ebp
 593:	c3                   	ret    
 594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 598:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 59f:	eb 87                	jmp    528 <printint+0x28>
 5a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop

000005b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	57                   	push   %edi
 5b4:	56                   	push   %esi
 5b5:	53                   	push   %ebx
 5b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5b9:	8b 75 0c             	mov    0xc(%ebp),%esi
 5bc:	0f b6 1e             	movzbl (%esi),%ebx
 5bf:	84 db                	test   %bl,%bl
 5c1:	0f 84 b8 00 00 00    	je     67f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 5c7:	8d 45 10             	lea    0x10(%ebp),%eax
 5ca:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 5cd:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5d0:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 5d2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5d5:	eb 37                	jmp    60e <printf+0x5e>
 5d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5de:	66 90                	xchg   %ax,%ax
 5e0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5e3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5e8:	83 f8 25             	cmp    $0x25,%eax
 5eb:	74 17                	je     604 <printf+0x54>
  write(fd, &c, 1);
 5ed:	83 ec 04             	sub    $0x4,%esp
 5f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5f3:	6a 01                	push   $0x1
 5f5:	57                   	push   %edi
 5f6:	ff 75 08             	pushl  0x8(%ebp)
 5f9:	e8 66 fe ff ff       	call   464 <write>
 5fe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 601:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 604:	0f b6 1e             	movzbl (%esi),%ebx
 607:	83 c6 01             	add    $0x1,%esi
 60a:	84 db                	test   %bl,%bl
 60c:	74 71                	je     67f <printf+0xcf>
    c = fmt[i] & 0xff;
 60e:	0f be cb             	movsbl %bl,%ecx
 611:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 614:	85 d2                	test   %edx,%edx
 616:	74 c8                	je     5e0 <printf+0x30>
      }
    } else if(state == '%'){
 618:	83 fa 25             	cmp    $0x25,%edx
 61b:	75 e7                	jne    604 <printf+0x54>
      if(c == 'd'){
 61d:	83 f8 64             	cmp    $0x64,%eax
 620:	0f 84 9a 00 00 00    	je     6c0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 626:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 62c:	83 f9 70             	cmp    $0x70,%ecx
 62f:	74 5f                	je     690 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 631:	83 f8 73             	cmp    $0x73,%eax
 634:	0f 84 d6 00 00 00    	je     710 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 63a:	83 f8 63             	cmp    $0x63,%eax
 63d:	0f 84 8d 00 00 00    	je     6d0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 643:	83 f8 25             	cmp    $0x25,%eax
 646:	0f 84 b4 00 00 00    	je     700 <printf+0x150>
  write(fd, &c, 1);
 64c:	83 ec 04             	sub    $0x4,%esp
 64f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 653:	6a 01                	push   $0x1
 655:	57                   	push   %edi
 656:	ff 75 08             	pushl  0x8(%ebp)
 659:	e8 06 fe ff ff       	call   464 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 65e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 661:	83 c4 0c             	add    $0xc,%esp
 664:	6a 01                	push   $0x1
  for(i = 0; fmt[i]; i++){
 666:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 669:	57                   	push   %edi
 66a:	ff 75 08             	pushl  0x8(%ebp)
 66d:	e8 f2 fd ff ff       	call   464 <write>
  for(i = 0; fmt[i]; i++){
 672:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 676:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 679:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 67b:	84 db                	test   %bl,%bl
 67d:	75 8f                	jne    60e <printf+0x5e>
    }
  }
}
 67f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 682:	5b                   	pop    %ebx
 683:	5e                   	pop    %esi
 684:	5f                   	pop    %edi
 685:	5d                   	pop    %ebp
 686:	c3                   	ret    
 687:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 690:	83 ec 0c             	sub    $0xc,%esp
 693:	b9 10 00 00 00       	mov    $0x10,%ecx
 698:	6a 00                	push   $0x0
 69a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 69d:	8b 45 08             	mov    0x8(%ebp),%eax
 6a0:	8b 13                	mov    (%ebx),%edx
 6a2:	e8 59 fe ff ff       	call   500 <printint>
        ap++;
 6a7:	89 d8                	mov    %ebx,%eax
 6a9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ac:	31 d2                	xor    %edx,%edx
        ap++;
 6ae:	83 c0 04             	add    $0x4,%eax
 6b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6b4:	e9 4b ff ff ff       	jmp    604 <printf+0x54>
 6b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 6c0:	83 ec 0c             	sub    $0xc,%esp
 6c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6c8:	6a 01                	push   $0x1
 6ca:	eb ce                	jmp    69a <printf+0xea>
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 6d0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6d6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 6d8:	6a 01                	push   $0x1
        ap++;
 6da:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 6dd:	57                   	push   %edi
 6de:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 6e1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6e4:	e8 7b fd ff ff       	call   464 <write>
        ap++;
 6e9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6ec:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ef:	31 d2                	xor    %edx,%edx
 6f1:	e9 0e ff ff ff       	jmp    604 <printf+0x54>
 6f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6fd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 700:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 703:	83 ec 04             	sub    $0x4,%esp
 706:	e9 59 ff ff ff       	jmp    664 <printf+0xb4>
 70b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 70f:	90                   	nop
        s = (char*)*ap;
 710:	8b 45 d0             	mov    -0x30(%ebp),%eax
 713:	8b 18                	mov    (%eax),%ebx
        ap++;
 715:	83 c0 04             	add    $0x4,%eax
 718:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 71b:	85 db                	test   %ebx,%ebx
 71d:	74 17                	je     736 <printf+0x186>
        while(*s != 0){
 71f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 722:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 724:	84 c0                	test   %al,%al
 726:	0f 84 d8 fe ff ff    	je     604 <printf+0x54>
 72c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 72f:	89 de                	mov    %ebx,%esi
 731:	8b 5d 08             	mov    0x8(%ebp),%ebx
 734:	eb 1a                	jmp    750 <printf+0x1a0>
          s = "(null)";
 736:	bb 68 09 00 00       	mov    $0x968,%ebx
        while(*s != 0){
 73b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 73e:	b8 28 00 00 00       	mov    $0x28,%eax
 743:	89 de                	mov    %ebx,%esi
 745:	8b 5d 08             	mov    0x8(%ebp),%ebx
 748:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74f:	90                   	nop
  write(fd, &c, 1);
 750:	83 ec 04             	sub    $0x4,%esp
          s++;
 753:	83 c6 01             	add    $0x1,%esi
 756:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 759:	6a 01                	push   $0x1
 75b:	57                   	push   %edi
 75c:	53                   	push   %ebx
 75d:	e8 02 fd ff ff       	call   464 <write>
        while(*s != 0){
 762:	0f b6 06             	movzbl (%esi),%eax
 765:	83 c4 10             	add    $0x10,%esp
 768:	84 c0                	test   %al,%al
 76a:	75 e4                	jne    750 <printf+0x1a0>
      state = 0;
 76c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 76f:	31 d2                	xor    %edx,%edx
 771:	e9 8e fe ff ff       	jmp    604 <printf+0x54>
 776:	66 90                	xchg   %ax,%ax
 778:	66 90                	xchg   %ax,%ax
 77a:	66 90                	xchg   %ax,%ax
 77c:	66 90                	xchg   %ax,%ax
 77e:	66 90                	xchg   %ax,%ax

00000780 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 780:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 781:	a1 c0 0f 00 00       	mov    0xfc0,%eax
{
 786:	89 e5                	mov    %esp,%ebp
 788:	57                   	push   %edi
 789:	56                   	push   %esi
 78a:	53                   	push   %ebx
 78b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 78e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 791:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 798:	89 c2                	mov    %eax,%edx
 79a:	8b 00                	mov    (%eax),%eax
 79c:	39 ca                	cmp    %ecx,%edx
 79e:	73 30                	jae    7d0 <free+0x50>
 7a0:	39 c1                	cmp    %eax,%ecx
 7a2:	72 04                	jb     7a8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a4:	39 c2                	cmp    %eax,%edx
 7a6:	72 f0                	jb     798 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ae:	39 f8                	cmp    %edi,%eax
 7b0:	74 30                	je     7e2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7b2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7b5:	8b 42 04             	mov    0x4(%edx),%eax
 7b8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7bb:	39 f1                	cmp    %esi,%ecx
 7bd:	74 3a                	je     7f9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7bf:	89 0a                	mov    %ecx,(%edx)
  freep = p;
}
 7c1:	5b                   	pop    %ebx
  freep = p;
 7c2:	89 15 c0 0f 00 00    	mov    %edx,0xfc0
}
 7c8:	5e                   	pop    %esi
 7c9:	5f                   	pop    %edi
 7ca:	5d                   	pop    %ebp
 7cb:	c3                   	ret    
 7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d0:	39 c2                	cmp    %eax,%edx
 7d2:	72 c4                	jb     798 <free+0x18>
 7d4:	39 c1                	cmp    %eax,%ecx
 7d6:	73 c0                	jae    798 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7de:	39 f8                	cmp    %edi,%eax
 7e0:	75 d0                	jne    7b2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 7e2:	03 70 04             	add    0x4(%eax),%esi
 7e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7e8:	8b 02                	mov    (%edx),%eax
 7ea:	8b 00                	mov    (%eax),%eax
 7ec:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ef:	8b 42 04             	mov    0x4(%edx),%eax
 7f2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7f5:	39 f1                	cmp    %esi,%ecx
 7f7:	75 c6                	jne    7bf <free+0x3f>
    p->s.size += bp->s.size;
 7f9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7fc:	89 15 c0 0f 00 00    	mov    %edx,0xfc0
    p->s.size += bp->s.size;
 802:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 805:	8b 43 f8             	mov    -0x8(%ebx),%eax
 808:	89 02                	mov    %eax,(%edx)
}
 80a:	5b                   	pop    %ebx
 80b:	5e                   	pop    %esi
 80c:	5f                   	pop    %edi
 80d:	5d                   	pop    %ebp
 80e:	c3                   	ret    
 80f:	90                   	nop

00000810 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	57                   	push   %edi
 814:	56                   	push   %esi
 815:	53                   	push   %ebx
 816:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 819:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 81c:	8b 3d c0 0f 00 00    	mov    0xfc0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 822:	8d 70 07             	lea    0x7(%eax),%esi
 825:	c1 ee 03             	shr    $0x3,%esi
 828:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 82b:	85 ff                	test   %edi,%edi
 82d:	0f 84 ad 00 00 00    	je     8e0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 833:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 835:	8b 48 04             	mov    0x4(%eax),%ecx
 838:	39 f1                	cmp    %esi,%ecx
 83a:	73 71                	jae    8ad <malloc+0x9d>
 83c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 842:	bb 00 10 00 00       	mov    $0x1000,%ebx
 847:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 84a:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 851:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 854:	eb 1b                	jmp    871 <malloc+0x61>
 856:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 860:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 862:	8b 4a 04             	mov    0x4(%edx),%ecx
 865:	39 f1                	cmp    %esi,%ecx
 867:	73 4f                	jae    8b8 <malloc+0xa8>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 869:	8b 3d c0 0f 00 00    	mov    0xfc0,%edi
 86f:	89 d0                	mov    %edx,%eax
 871:	39 c7                	cmp    %eax,%edi
 873:	75 eb                	jne    860 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 875:	83 ec 0c             	sub    $0xc,%esp
 878:	ff 75 e4             	pushl  -0x1c(%ebp)
 87b:	e8 4c fc ff ff       	call   4cc <sbrk>
  if(p == (char*)-1)
 880:	83 c4 10             	add    $0x10,%esp
 883:	83 f8 ff             	cmp    $0xffffffff,%eax
 886:	74 1b                	je     8a3 <malloc+0x93>
  hp->s.size = nu;
 888:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 88b:	83 ec 0c             	sub    $0xc,%esp
 88e:	83 c0 08             	add    $0x8,%eax
 891:	50                   	push   %eax
 892:	e8 e9 fe ff ff       	call   780 <free>
  return freep;
 897:	a1 c0 0f 00 00       	mov    0xfc0,%eax
      if((p = morecore(nunits)) == 0)
 89c:	83 c4 10             	add    $0x10,%esp
 89f:	85 c0                	test   %eax,%eax
 8a1:	75 bd                	jne    860 <malloc+0x50>
        return 0;
  }
}
 8a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8a6:	31 c0                	xor    %eax,%eax
}
 8a8:	5b                   	pop    %ebx
 8a9:	5e                   	pop    %esi
 8aa:	5f                   	pop    %edi
 8ab:	5d                   	pop    %ebp
 8ac:	c3                   	ret    
    if(p->s.size >= nunits){
 8ad:	89 c2                	mov    %eax,%edx
 8af:	89 f8                	mov    %edi,%eax
 8b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 8b8:	39 ce                	cmp    %ecx,%esi
 8ba:	74 54                	je     910 <malloc+0x100>
        p->s.size -= nunits;
 8bc:	29 f1                	sub    %esi,%ecx
 8be:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 8c1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 8c4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 8c7:	a3 c0 0f 00 00       	mov    %eax,0xfc0
}
 8cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8cf:	8d 42 08             	lea    0x8(%edx),%eax
}
 8d2:	5b                   	pop    %ebx
 8d3:	5e                   	pop    %esi
 8d4:	5f                   	pop    %edi
 8d5:	5d                   	pop    %ebp
 8d6:	c3                   	ret    
 8d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8de:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 8e0:	c7 05 c0 0f 00 00 c4 	movl   $0xfc4,0xfc0
 8e7:	0f 00 00 
    base.s.size = 0;
 8ea:	bf c4 0f 00 00       	mov    $0xfc4,%edi
    base.s.ptr = freep = prevp = &base;
 8ef:	c7 05 c4 0f 00 00 c4 	movl   $0xfc4,0xfc4
 8f6:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 8fb:	c7 05 c8 0f 00 00 00 	movl   $0x0,0xfc8
 902:	00 00 00 
    if(p->s.size >= nunits){
 905:	e9 32 ff ff ff       	jmp    83c <malloc+0x2c>
 90a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 910:	8b 0a                	mov    (%edx),%ecx
 912:	89 08                	mov    %ecx,(%eax)
 914:	eb b1                	jmp    8c7 <malloc+0xb7>
